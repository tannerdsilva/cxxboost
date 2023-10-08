import ArgumentParser
import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax

/// represents a module in the boost source code.
struct BoostSourceModule:Codable, Hashable {

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
		self.cloneName = base.lastPathComponent
	}

	func generateTargetDependencyLine() -> FunctionCallExprSyntax {
		let declRefExpr = DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("product"))
		let memberAccessExpr = MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:declRefExpr)
		let nameLabel = LabeledExprSyntax(label:"name", colon:TokenSyntax.colonToken(), expression:StringLiteralExprSyntax(content:self.name.packageTargetName), trailingComma:TokenSyntax.commaToken())
		let packageLabel = LabeledExprSyntax(label:"package", colon:TokenSyntax.colonToken(), expression:StringLiteralExprSyntax(content:"_boost_master_prep"), trailingComma:TokenSyntax.commaToken())
		let labeledList = LabeledExprListSyntax([
			nameLabel,
			packageLabel
		])
		return FunctionCallExprSyntax(calledExpression:memberAccessExpr, leftParen:TokenSyntax.leftParenToken(), arguments:labeledList, rightParen:TokenSyntax.rightParenToken(), trailingClosure:nil)
	}

	/// writes the module map file within the module directory.
	/// - parameter destination: the path to the module directory.
	func writeModuleMapContents(destination path:URL) throws {
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
		try moduleMapContent.write(to:path.appendingPathComponent("module.modulemap"), atomically:true, encoding:.utf8)
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
				return "cxxboost_" + name
			case .split(let firstpart, let secondpart):
				return "cxxboost_" + firstpart + "-" + secondpart
		}
	}

	init?(packageTargetName:String) {
		guard packageTargetName.hasPrefix("cxxboost_") else {
			return nil
		}
		let modPackTargName = packageTargetName.dropFirst("cxxboost_".count)
		switch modPackTargName.contains("-") {
			case true:
				let splitName = modPackTargName.split(separator:"-", maxSplits:1, omittingEmptySubsequences:false)
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

