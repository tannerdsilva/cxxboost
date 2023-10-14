import ArgumentParser
import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax

/// represents a module in the boost source code.
struct BoostSourceModule:Codable, Hashable {

	/// the prefix for the package target name
	static let packageTargetNamePrefix = "cxxboost_"

	/// represents a header file or directory in the module map.
	enum ModuleMapHeader:Codable, Hashable, Equatable {
		case headerFile(String)
		case headerDirectory(String)
	}

	enum Name:Codable, Hashable, Equatable {
		/// represents a single piece name
		case uniform(String)

		/// represents a split name
		case split(String, String)

		func pathToSourceInBoostProject(projectLocation:URL) -> URL {
			switch self {
				case .uniform(let name):
					return projectLocation.appendingPathComponent("libs").appendingPathComponent(name)
				case .split(let firstpart, let secondpart):
					return projectLocation.appendingPathComponent("libs").appendingPathComponent(firstpart).appendingPathComponent(secondpart)
			}
		}
	}

	// the name of the module
	let name:Name

	// the excludes for this module
	let includeHeaders:[ModuleMapHeader]

	// indicates whether or not this module has source code
	var hasSource:Bool

	// the origin url for the git repository
	let remoteURL:String

	// the target dependencies for this module
	let dependencies:Set<Name>

	// the commit hash to use for this module
	let commitHash:String

	// the name that will appear in the directory when the module is cloned
	let cloneName:String

	init(boostdepListName:String, hasSource:Bool, basedIn base:URL, dependencies:Set<String>, logger:Logger) async throws {		
		let name = Name(boostdepName:boostdepListName)!
		self.name = name
		let path = name.pathToSourceInBoostProject(projectLocation:base)
		self.hasSource = hasSource
		
		let sourceIncludeDir = path.appendingPathComponent("include", isDirectory:true)
		let sourceIncludeBoostDir = sourceIncludeDir.appendingPathComponent("boost", isDirectory:true)
		let includeContents = try FileManager.default.contentsOfDirectory(atPath:sourceIncludeBoostDir.path)
		var includeHeaders = [ModuleMapHeader]()
		
		for curContent in includeContents {
			if curContent.hasSuffix(".hpp") {
				includeHeaders.append(.headerFile(curContent))
			} else if curContent.contains(".") == false {
				includeHeaders.append(.headerDirectory(curContent))
			}
		}
		self.includeHeaders = includeHeaders

		// determine if the module directory exists
		guard FileManager.default.fileExists(atPath:path.path) else {
			throw ValidationError(message:"the module '\(path.path)' does not exist.")
		}

		// determine the remote URL for this module
		let gitRemoteCommand = try await Command("git", arguments:["remote", "get-url", "origin"], workingDirectory:path).runSync()
		guard gitRemoteCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(gitRemoteCommand)' failed with exit code \(gitRemoteCommand.exitCode).")
		}
		guard gitRemoteCommand.stdout.count == 1 && String(data:gitRemoteCommand.stdout[0], encoding:.utf8)?.hasPrefix("https") == true else {
			throw ValidationError(message:"the command '\(gitRemoteCommand)' failed because there was unexpected output.")
		}
		self.remoteURL = String(data:gitRemoteCommand.stdout[0], encoding:.utf8)!.trimmed()
		self.dependencies = Set(dependencies.compactMap { Name(boostdepName:$0) })
		
		// determine the commit hash for this module
		let gitRevParseCommand = try await Command("git", arguments:["rev-parse", "HEAD"], workingDirectory:path).runSync()
		guard gitRevParseCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(gitRevParseCommand)' failed with exit code \(gitRevParseCommand.exitCode).")
		}
		guard gitRevParseCommand.stdout.count == 1 else {
			throw ValidationError(message:"the command '\(gitRevParseCommand)' failed because there was unexpected output.")
		}
		self.commitHash = String(data:gitRevParseCommand.stdout[0], encoding:.utf8)!.trimmed()
		self.cloneName = path.lastPathComponent
	}

	/// writes the module map file within the module directory.
	/// - parameter destination: the path to the module directory.
	func buildModuleMapContents() -> String {
		var moduleMapContent = "module \(self.name.packageTargetName) [system] {\n"
		for curEntry in self.includeHeaders {
			switch curEntry {
				case .headerFile(let headerName):
					moduleMapContent += "\theader \"./boost/\(headerName)\"\n"
				case .headerDirectory(let headerName):
					moduleMapContent += "\theader \"./boost/\(headerName)/*\"\n"
			}
		}
		moduleMapContent += "\texport *\n"
		moduleMapContent += "}"
		return moduleMapContent
	}

	func initializeModule(log:Logger, packageBasePath:URL) async throws {
		let allModulesPath = packageBasePath.appendingPathComponent("Modules")
		let ourModulePath = allModulesPath.appendingPathComponent(self.name.packageTargetName)
		let moduleIncludes = ourModulePath.appendingPathComponent("include")
		let moduleCantSeeMe = ourModulePath.appendingPathComponent(".cant-see-me")
		let moduleSources = ourModulePath.appendingPathComponent("src")

		// create the include directory if it does not exist. every module has an include directory, so this is always needed.
		if FileManager.default.fileExists(atPath:moduleIncludes.path) == false {
			log.info("the module include path does not exist. it is being created.")
			try FileManager.default.createDirectory(at:moduleIncludes, withIntermediateDirectories:true, attributes:nil)
		}
		// create hte .cant-see-me directory if it does not exist. every module has a .cant-see-me directory, so this is always needed.
		if FileManager.default.fileExists(atPath:moduleCantSeeMe.path) == false {
			log.info("the module cant-see-me path does not exist. it is being created.")
			try FileManager.default.createDirectory(at:moduleCantSeeMe, withIntermediateDirectories:true, attributes:nil)
		}

		// write the module map file in the include directory
		let moduleMapFile = moduleIncludes.appendingPathComponent("module.modulemap")
		let mapContents = self.buildModuleMapContents()
		do {
			try mapContents.write(to:moduleMapFile, atomically:true, encoding:.utf8)
			log.info("successfully wrote module map file to '\(moduleMapFile.path)'.")
		} catch let error {
			log.error("failed to write module map file to '\(moduleMapFile.path)': \(error)")
			throw ValidationError(message:"failed to write module map file to '\(moduleMapFile.path)': \(error)")
		}

		// this is the path that the project was cloned to
		let clonedName = moduleCantSeeMe.appendingPathComponent(self.cloneName)
		let clonedIncludeName = clonedName.appendingPathComponent("include")
		let clonedSourceName = clonedName.appendingPathComponent("src")

		// clone the submodule if needed.
		let submoduleCloneCommand = try Command("git", arguments:["-C", packageBasePath.path, "submodule", "add", self.remoteURL, clonedName.path])
		log.critical("attempting to run command '\(submoduleCloneCommand)'")
		
		let submoduleCloneCommandResult = try await submoduleCloneCommand.runSync()
		switch submoduleCloneCommandResult.exitCode {
			case 0:
				// valid result
				log.info("the submodule was cloned successfully.")
				break;
			case 128:	
				// check the output to ensure it contains "already exists"
				for curLine in submoduleCloneCommandResult.stderr {
					let curLineString = String(data:curLine, encoding:.utf8)!.trimmed()
					log.critical("stderr: \(curLineString)")
				}
				for curLine in submoduleCloneCommandResult.stdout {
					let curLineString = String(data:curLine, encoding:.utf8)!.trimmed()
					log.critical("stdout: \(curLineString)")
				}
				let firstLineString = String(data:submoduleCloneCommandResult.stderr[0], encoding:.utf8)!.trimmed()
				if firstLineString.contains("already exists") == false {
					throw ValidationError(message:"the command '\(submoduleCloneCommandResult)' failed with exit code \(submoduleCloneCommandResult.exitCode).")
				}
			default:
				throw ValidationError(message:"the command '\(submoduleCloneCommandResult)' failed with exit code \(submoduleCloneCommandResult.exitCode).")
		}
		
		// checkout the correct commit hash
		let gitFetchResult = try await Command("git", arguments:["fetch"], workingDirectory:clonedName).runSync()
		guard gitFetchResult.exitCode == 0 else {
			throw ValidationError(message:"the command '\(gitFetchResult)' failed with exit code \(gitFetchResult.exitCode).")
		}
		log.info("successfully fetched the latest changes from the submodule.")

		let submoduleCheckoutCommandResult2 = try await Command("git", arguments:["checkout", self.commitHash], workingDirectory:clonedName).runSync()
		guard submoduleCheckoutCommandResult2.exitCode == 0 else {
			throw ValidationError(message:"the command '\(submoduleCheckoutCommandResult2)' failed with exit code \(submoduleCheckoutCommandResult2.exitCode).")
		}
		log.info("successfully checked out the correct commit hash.")

		// symlink the include directory into the module directory
		let symIncludeDest = clonedIncludeName
		let symIncludeSource = moduleIncludes.appendingPathComponent("boost")
		do {
			log.info("attempting to create symlink from (source) '\(symIncludeDest)' to (destination) '\(symIncludeSource)'")
			try FileManager.default.createSymbolicLink(at:symIncludeDest, withDestinationURL:symIncludeSource)
			log.info("successfully created symlink from (source) '\(symIncludeDest)' to (destination) '\(symIncludeSource)'")
		} catch let error {
			log.critical("failed to create symlink from (source) '\(symIncludeDest)' to (destination) '\(symIncludeSource)': \(error)")
			throw error
		}
		// symlink the source directory into the module directory
		if self.hasSource {
			try FileManager.default.createSymbolicLink(at:clonedName.appendingPathComponent("src"), withDestinationURL:moduleSources)
		}
	}
}

extension BoostSourceModule.ModuleMapHeader {
	init(from decoder:Decoder) throws {
		let container = try decoder.singleValueContainer()
		let stringValue = try container.decode(String.self)
		if stringValue.hasSuffix(".hpp") {
			self = .headerFile(stringValue)
		} else {
			self = .headerDirectory(stringValue)
		}
	}
	func encode(to encoder:Encoder) throws {
		var container = encoder.singleValueContainer()
		switch self {
			case .headerFile(let headerName):
				try container.encode(headerName)
			case .headerDirectory(let headerName):
				try container.encode(headerName)
		}
	}
}

extension BoostSourceModule.Name {
	init(from decoder:Decoder) throws {
		var container = try decoder.unkeyedContainer()
		let type:UInt8 = try container.decode(UInt8.self)
		switch type {
			case 0:
				self = .uniform(try container.decode(String.self))
			case 1:
				self = .split(try container.decode(String.self), try container.decode(String.self))
			default:
				throw DecodingError.dataCorruptedError(in:container, debugDescription:"expected 0 or 1, found \(type).")
		}
	}
	func encode(to encoder:Encoder) throws {
		var container = encoder.unkeyedContainer()
		switch self {
			case .uniform(let name):
				try container.encode(UInt8(0))
				try container.encode(name)
			case .split(let firstpart, let secondpart):
				try container.encode(UInt8(1))
				try container.encode(firstpart)
				try container.encode(secondpart)
		}
	}

	var boostdepName:String {
		switch self {
			case .uniform(let name):
				return name
			case .split(let firstpart, let secondpart):
				return firstpart + "~" + secondpart
		}
	}

	var packageTargetName:String {
		switch self {
			case .uniform(let name):
				return BoostSourceModule.packageTargetNamePrefix + name
			case .split(let firstpart, let secondpart):
				return BoostSourceModule.packageTargetNamePrefix + firstpart + "__" + secondpart
		}
	}

	init?(packageTargetName:String) {
		guard packageTargetName.hasPrefix(BoostSourceModule.packageTargetNamePrefix) else {
			return nil
		}
		let modPackTargName = packageTargetName.dropFirst(BoostSourceModule.packageTargetNamePrefix.count)
		switch modPackTargName.contains("-") {
			case true:
				let splitName = modPackTargName.split(separator:"__", maxSplits:1, omittingEmptySubsequences:false)
				guard splitName.count == 2 else {
					return nil
				}
				self = .split(String(splitName[0]), String(splitName[1]))
			case false:
				self = .uniform(String(modPackTargName))
		}
	}

	init?(boostdepName:String) {
		switch boostdepName.contains("~") {
			case true:
				let splitName = boostdepName.split(separator:"~", maxSplits:1, omittingEmptySubsequences:false)
				guard splitName.count == 2 else {
					return nil
				}
				self = .split(String(splitName[0]), String(splitName[1]))
			case false:
				self = .uniform(boostdepName)
		}
	}

	static func == (lhs:BoostSourceModule.Name, rhs:BoostSourceModule.Name) -> Bool {
		switch (lhs, rhs) {
			case (.uniform(let lhsName), .uniform(let rhsName)):
				return lhsName == rhsName
			case (.split(let lhsFirst, let lhsSecond), .split(let rhsFirst, let rhsSecond)):
				return lhsFirst == rhsFirst && lhsSecond == rhsSecond
			default:
				return false
		}
	}

	func hash(into hasher:inout Hasher) {
		switch self {
			case .uniform(let name):
				hasher.combine(name)
			case .split(let firstpart, let secondpart):
				hasher.combine(firstpart)
				hasher.combine(secondpart)
		}
	}
}

