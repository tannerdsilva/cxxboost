import ArgumentParser
import SwiftSlash
import Foundation
import Logging

struct ValidationError:Swift.Error {
	let message:String
}

@main
struct CLI:AsyncParsableCommand {
	static var configuration = CommandConfiguration(
		commandName:"_build_master_prep",
		abstract:"prepares the boost source directory for building.",
		subcommands:[
			PrepareModule.self,
			// BoostdepBuilder.self,
			PrepareBoostSource.self
		]
	)
}

struct BoostModuleConfiguration:Codable {
	let name:String
	var primaryDependencies:[String]
	var excludes:[String]
	var hasSource:Bool
}

struct GitTool {
	let base:URL

	init(base:URL) {
		self.base = base
	}

	func removeSubmodule(name:String) async throws {
		// deinit the submodule
		let deinitCommand = try await Command("git", arguments:["submodule", "deinit", name], workingDirectory:self.base).runSync()
		guard deinitCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(deinitCommand)' failed with exit code \(deinitCommand.exitCode).")
		}

		// remove the submodule
		let removeCommand = try await Command("git", arguments:["rm", "-f", name], workingDirectory:self.base).runSync()
		guard removeCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(removeCommand)' failed with exit code \(removeCommand.exitCode).")
		}
	}

	func listSubmoduleNames() async throws -> [String] {
		let listCommand = try await Command(bash:"git submodule status | awk '{print $2}'", workingDirectory:self.base).runSync()
		guard listCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(listCommand)' failed with exit code \(listCommand.exitCode).")
		}

		var names:[String] = []
		for line in listCommand.stdout {
			let makeString = String(data:line, encoding:.utf8)!
			if makeString.filter({ $0.isWhitespace }).count > 0 {
				names.append(makeString)
			}
		}

		return names
	}
}


struct PrepareBoostSource:AsyncParsableCommand {
	static var configuration = CommandConfiguration(
		commandName:"prepare-boost-source",
		abstract:"prepares the boost source directory for building."
	)

	@Argument(help:"the relative path to the swift package source directory.")
	var sourceBase:String

	@Argument(help:"the commit hash or tag to checkout and prepare")
	var checkout:String

	mutating func run() async throws {
		let mainLogger = Logger(label:"boost-build-plugin")

		// lay out the basics
		let baseURL = URL(fileURLWithPath:sourceBase)
		let boostPath = baseURL.appendingPathComponent("boost")

		// remove the old source and any of the submodules that might have correlated
		let gitTool = GitTool(base:baseURL)
		let allModules = try await gitTool.listSubmoduleNames()
		for module in allModules {
			mainLogger.info("removing submodule '\(module)'...")
			try await gitTool.removeSubmodule(name:module)
		}

		mainLogger.info("removing boost")

		// remove any of the current boost source code
		if FileManager.default.fileExists(atPath:boostPath.path) {
			try FileManager.default.removeItem(atPath:boostPath.path)
		}

		mainLogger.info("acquiring boost source code from '\(sourceBase)'...this may take some time, since boost has many submodules...")

		// checkout the boost source code
		let checkoutCommand = try await Command("git", arguments:["clone", "https://github.com/boostorg/boost.git"], workingDirectory:URL(fileURLWithPath:sourceBase)).runSync()
		guard checkoutCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(checkoutCommand)' failed with exit code \(checkoutCommand.exitCode).")
		}

		// checkout the correct commit
		let checkoutCommitCommand = try await Command("git", arguments:["checkout", checkout], workingDirectory:baseURL.appendingPathComponent("boost")).runSync()
		guard checkoutCommitCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(checkoutCommitCommand)' failed with exit code \(checkoutCommitCommand.exitCode).")
		}

		let boostCheckoutDir = baseURL.appendingPathComponent("boost")

		// update all of the submodules so that we can get boostdep and it can work with the modules
		let gitSubmoduleCommand = try await Command("git", arguments:["submodule", "update", "--init", "--recursive", boostCheckoutDir.path], workingDirectory:baseURL.appendingPathComponent("boost")).runSync()
		guard gitSubmoduleCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(gitSubmoduleCommand)' failed with exit code \(gitSubmoduleCommand.exitCode).")
		}

		// now we need to build boostdep

		// build more paths. we are navigating to the boostdep tool.
		let boostTools = boostPath.appendingPathComponent("tools")
		let boostToolBoostdep = boostTools.appendingPathComponent("boostdep")
		let boostdepBuildDir = boostToolBoostdep.appendingPathComponent("build")

		// build boostdep

		mainLogger.info("building boostdep...")

		let makecommand = try await Command(bash:"cmake .. && make", workingDirectory:boostdepBuildDir).runSync()
		guard makecommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(makecommand)' failed with exit results \(makecommand.stdout.map { String(data:$0, encoding:.utf8) }).")
		}

		mainLogger.info("running boostdep...")

		// run the boostdep tool
		let boostdepCommand = try Command(boostdepBuildDir.appendingPathComponent("boostdep").path, arguments:["--list-modules"], workingDirectory:boostPath)
		let boostdepCommandResult = try await boostdepCommand.runSync()
		guard boostdepCommandResult.exitCode == 0 else {
			throw ValidationError(message:"the command '\(boostdepCommand)' failed with exit code \(boostdepCommandResult.exitCode).")
		}

		// parse the output
		mainLogger.info("building \(boostdepCommandResult.stdout.count) exclude graph for modules...")

		var allModuleNames = Set(boostdepCommandResult.stdout.compactMap({ String(data:$0, encoding:.utf8) }))
		
		// determine the excludes for all of the modules
		let boostdepExcludesCommand = try Command(boostdepBuildDir.appendingPathComponent("boostdep").path, arguments:["--list-exceptions"], workingDirectory:boostPath)
		let boostdepExcludesCommandResult = try await boostdepExcludesCommand.runSync()
		guard boostdepExcludesCommandResult.exitCode == 0 else {
			throw ValidationError(message:"the command '\(boostdepExcludesCommand)' failed with exit code \(boostdepExcludesCommandResult.exitCode).")
		}

		// build a hashmap of the excludes and their associated modules
		var moduleExcludes:[String:[String]] = [:]
		var currentModule:String? = nil
		for exclude in boostdepExcludesCommandResult.stdout {
			let asString = String(data:exclude, encoding:.utf8)!
			if asString.first?.isWhitespace == true {
				// this is an exclude. append it to the current module
				let trimmed = asString.trimmed()
				if moduleExcludes[currentModule!] == nil {
					moduleExcludes[currentModule!] = []
				}
				moduleExcludes[currentModule!]!.append(trimmed)
			} else {
				// this is a module.
				var modCurModule = asString.trimmed()
				if modCurModule.hasSuffix(":") {
					modCurModule.removeLast()
				}
				currentModule = modCurModule
			}
		}

		for (module, excludes) in moduleExcludes {
			mainLogger.info("module '\(module)' has \(excludes.count) excludes.")
		}
	}
}

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
	func replacingNonAlphaWithUnderscores() -> String {
		var replaceString = ""
		for char in self {
			if char.isLetter {
				replaceString.append(char)
			} else {
				replaceString.append("_")
			}
		}
		return replaceString
	}
}

struct PrepareModule:AsyncParsableCommand {
	static var configuration = CommandConfiguration(
		commandName:"prepare",
		abstract:"prepares the boost source directory for building."
	)

	struct GitError:Swift.Error {}

	@Argument(help:"the base path of the modules directory.")
	var moduleBase:String

	@Argument(help:"the name of the boost module to prepare.")
	var moduleName:String

	@Flag var noModuleMap:Bool = false

	mutating func run() async throws {
		let mainLogger = Logger(label:"boost-build-plugin")

		// create the content for the package.swift file
		let packageContent = """
		// swift-tools-version: 5.9
		import PackageDescription
		let package = Package(
			name: "\(moduleName)",
			products: [
				.library(
					name: "\(moduleName)",
					targets: ["\(moduleName)"]),
			],
			targets: [
				.target(
					name: "\(moduleName)",
					path:"./",
					exclude:["\(moduleName)"],
					sources:[],
					publicHeadersPath:"include"),
			]
		)
		"""

		// define the module path
		let modulePath = URL(fileURLWithPath:moduleBase).appendingPathComponent(moduleName)

		// create the directory if it doesn't exist
		if !FileManager.default.fileExists(atPath:modulePath.path) {
			try FileManager.default.createDirectory(at:modulePath, withIntermediateDirectories:true, attributes:nil)
		}

		// write the file
		try packageContent.write(to:modulePath.appendingPathComponent("Package.swift"), atomically:true, encoding:.utf8)

		// add the git submodule
		let addCommand = try await Command("git", arguments:["submodule", "add", "https://github.com/boostorg/\(moduleName).git"], workingDirectory:modulePath).runSync()
		guard addCommand.exitCode == 0 else {
			throw GitError()
		}

		// create the include directory if it doesn't exist
		let moduleIncludeDir = modulePath.appendingPathComponent("include")
		if !FileManager.default.fileExists(atPath:moduleIncludeDir.path) {
			try FileManager.default.createDirectory(at:moduleIncludeDir, withIntermediateDirectories:true, attributes:nil)
		}

		if noModuleMap == false {
			// build a modulemap for this module
			let moduleMapContent = """
			module \(moduleName) {
				header "./"
				export *
			}
			"""

			// write the modulemap
			try moduleMapContent.write(to:moduleIncludeDir.appendingPathComponent("module.modulemap"), atomically:true, encoding:.utf8)
		}

		// symlink the boost directory
		let linkDest = modulePath.appendingPathComponent("\(moduleName)").appendingPathComponent("include").appendingPathComponent("boost")
		try FileManager.default.createSymbolicLink(at:moduleIncludeDir.appendingPathComponent("boost"), withDestinationURL:linkDest)
	}
}

// struct UpdateSubmodules:AsyncParsableCommand {
// 	@Option(help:"the relative path to the boost source directory.")
// 	var relativePath:String = "./boost"

// 	mutating func run() async throws {
// 		let mainLogger = Logger(label:"boost-build-plugin")

// 		let boostPath = URL(fileURLWithPath:relativePath)
		
// 		// verify that the path exists
// 		guard FileManager.default.fileExists(atPath:boostPath.path) else {
// 			throw ValidationError(message:"the path '\(boostPath.path)' does not exist.")
// 		}

// 		mainLogger.info("acquiring boost source code from '\(boostPath.path)'...this may take some time, since boost has many submodules...")

// 		// run git submodule update --init --recursive
// 		let updatecommand = try Command("git", arguments:["status"])

// 		let runResult = try await updatecommand.runSync()
// 		guard runResult.exitCode == 0 else {
// 			mainLogger.critical("the command '\(updatecommand)' failed with exit code \(runResult.exitCode).")
// 			throw ValidationError(message:"the command '\(updatecommand)' failed with exit code \(runResult.exitCode).")
// 		}

// 		mainLogger.info("all boost submodules are up to date.")
// 	}
// }