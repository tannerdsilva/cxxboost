import ArgumentParser
import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax

struct ValidationError:Swift.Error {
	let message:String
}

@main
struct CLI:AsyncParsableCommand {
	static let configuration = CommandConfiguration(
		commandName:"_build_master_prep",
		abstract:"prepares the boost source directory for building.",
		subcommands:[
			PrepareModule.self,
			PrepareBoostSource.self,
			ParseCheckoutValue.self,
			RenderTargets.self,
		]
	)
}

extension CLI {
	struct RenderTargets:AsyncParsableCommand {
		static let configuration = CommandConfiguration(
			commandName:"render-package-targets",
			abstract:"renders the package targets for the boost source modules."
		)

		@Argument(help:"the relative path to the swift package source directory.")
		var packageBase:String

		mutating func run() async throws {
			let baseURL = URL(fileURLWithPath:packageBase)
			let modulesDir = baseURL.appendingPathComponent("Modules")
			let modulesFile = modulesDir.appendingPathComponent("boost-modules.json")

			let modulesData = try Data(contentsOf:modulesFile)
			let decoder = JSONDecoder()
			let decodedModules = try decoder.decode([String:[String:BoostSourceModule]].self, from:modulesData)
			let firstItem = decodedModules.first!.value
			
			let myParsedPackage = try ParsedBasePackage.load(log:Logger(label:"boost-build-plugin"), packageDirectory:baseURL)
		}
	}
}

extension CLI {

	struct ParseCheckoutValue:AsyncParsableCommand {
		
		@Argument(help:"the path to the base of the swift package.")
		var packagePath:String

		mutating func run() async throws {
			var mainLogger = Logger(label:"boost-build-plugin")
			let checkoutValue = try parsePackageCheckoutValue(logger:mainLogger, packageURL:URL(fileURLWithPath:packagePath))
			print(checkoutValue)
		}
	}

}


struct PackageDescriptionWithDependencies {
	let source:BoostSourceModule
	let primaryDepends:[BoostSourceModule]


	init(source:BoostSourceModule, primaryDepends:[BoostSourceModule]) {
		self.source = source
		self.primaryDepends = primaryDepends

		
	}
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
	var workingBase:String

	@Argument(help:"the relative path to the swift package source directory.")
	var packageBase:String

	// @Flag(help:"indicates whether or not to clean the build directory before building.")
	// var cleanBuild:Bool = false

	mutating func run() async throws {
		let packBaseURL = URL(fileURLWithPath:packageBase)

		var mainLogger = Logger(label:"boost-build-plugin")
		mainLogger.logLevel = .trace

		let boostCheckout = try parsePackageCheckoutValue(logger:mainLogger, packageURL:packBaseURL)

		mainLogger.critical("preparing boost source code for building in the swift package manager. this will take some time...")

		// lay out the basics
		let baseURL = URL(fileURLWithPath:workingBase)

		mainLogger.notice("working out of directory '\(baseURL.path)'")
		
		let boostPath = baseURL.appendingPathComponent("boost")

		// remove the old source and any of the submodules that might have correlated
		let gitTool = GitTool(base:baseURL)
		let allModules = try await gitTool.listSubmoduleNames()
		for module in allModules {
			mainLogger.info("removing existing boost submodule '\(module)'...")
			try await gitTool.removeSubmodule(name:module)
		}

		mainLogger.info("removing existing boost source...")

		// remove the old source
		if FileManager.default.fileExists(atPath:boostPath.path) {
			try FileManager.default.removeItem(atPath:boostPath.path)
		}

		mainLogger.info("acquiring boost source code with git...this may take some time, since boost has many submodules...")

		// checkout the boost source code
		let checkoutCommand = try await Command("git", arguments:["clone", "https://github.com/boostorg/boost.git"], workingDirectory:baseURL).runSync()
		guard checkoutCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(checkoutCommand)' failed with exit code \(checkoutCommand.exitCode).")
		}

		// // checkout the correct commit
		let checkoutCommitCommand = try await Command("git", arguments:["checkout", boostCheckout], workingDirectory:baseURL.appendingPathComponent("boost")).runSync()
		guard checkoutCommitCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(checkoutCommitCommand)' failed with exit code \(checkoutCommitCommand.exitCode).")
		}

		let boostCheckoutDir = baseURL.appendingPathComponent("boost")

		// update all of the submodules so that we can get boostdep and it can work with the modules
		let gitSubmoduleCommand = try await Command("git", arguments:["submodule", "update", "--init", "--recursive", boostCheckoutDir.path], workingDirectory:baseURL.appendingPathComponent("boost")).runSync()
		guard gitSubmoduleCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(gitSubmoduleCommand)' failed with exit code \(gitSubmoduleCommand.exitCode).")
		}

		// build more paths. we are navigating to the boostdep tool.
		let boostTools = boostPath.appendingPathComponent("tools")
		let boostToolBoostdep = boostTools.appendingPathComponent("boostdep")
		let boostdepBuildDir = boostToolBoostdep.appendingPathComponent("build")

		mainLogger.info("bootstrapping boost...")

		// bootstrap the project
		let boostrapCommand = try await Command(bash:"./bootstrap.sh", workingDirectory:boostPath).runSync()
		guard boostrapCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(boostrapCommand)' failed with exit code \(boostrapCommand.exitCode).")
		}

		mainLogger.info("building boostdep...")

		// build boostdep
		let makecommand = try await Command(bash:"cmake .. && make", workingDirectory:boostdepBuildDir).runSync()
		guard makecommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(makecommand)' failed with exit results \(makecommand.stdout.map { String(data:$0, encoding:.utf8) }).")
		}

		mainLogger.info("mapping code and graphs...")

		// run the boostdep tool
		let boostdepCommand = try Command(boostdepBuildDir.appendingPathComponent("boostdep").path, arguments:["--list-modules"], workingDirectory:boostPath)
		let boostdepCommandResult = try await boostdepCommand.runSync()
		guard boostdepCommandResult.exitCode == 0 else {
			throw ValidationError(message:"the command '\(boostdepCommand)' failed with exit code \(boostdepCommandResult.exitCode).")
		}

		let allModuleNames = Set(boostdepCommandResult.stdout.compactMap({ String(data:$0, encoding:.utf8)!.trimmed() }))
		
		mainLogger.info("found \(allModuleNames.count) modules in boost source.")

		// this is used to match the module names from the loose structure of boostdep output
		let regexName = try! Regex<(Substring, Substring)>("^([a-zA-Z0-9_~/]+)(?=:)")

		// build a list of the buildable targets
		let boostdepBuildableCommand = try await Command(boostdepBuildDir.appendingPathComponent("boostdep").path, arguments:["--list-buildable"], workingDirectory:boostPath).runSync()
		guard boostdepBuildableCommand.exitCode == 0 else {
			throw ValidationError(message:"the command '\(boostdepBuildableCommand)' failed with exit code \(boostdepBuildableCommand.exitCode).")
		}
		let buildableTargets = Set(boostdepBuildableCommand.stdout.compactMap({ String(data:$0, encoding:.utf8)!.trimmed() }))
		
		var moduleDependencies:[String:Set<String>] = [:]
		for moduleName in allModuleNames {
			
			// acquire all of the dependencies for each target
			let boostdepPrimaryDependenciesCommand = try Command(boostdepBuildDir.appendingPathComponent("boostdep").path, arguments:["--primary", moduleName], workingDirectory:boostPath)
			let boostdepPrimaryDependenciesCommandResult = try await boostdepPrimaryDependenciesCommand.runSync()
			guard boostdepPrimaryDependenciesCommandResult.exitCode == 0 else {
				throw ValidationError(message:"the command '\(boostdepPrimaryDependenciesCommand)' failed with exit code \(boostdepPrimaryDependenciesCommandResult.exitCode).")
			}
			guard boostdepPrimaryDependenciesCommandResult.stdout.count > 0 else {
				throw ValidationError(message:"the command '\(boostdepPrimaryDependenciesCommand)' failed with exit code \(boostdepPrimaryDependenciesCommandResult.exitCode).")
			}

			// list the module dependencies
			for curDat in boostdepPrimaryDependenciesCommandResult.stdout.dropFirst() {
				let getString = String(data:curDat, encoding:.utf8)!
				if let firstMatch = getString.matches(of:regexName).first {
					let matchedString = String(firstMatch.output.1)
					if var hasMatch = moduleDependencies[moduleName] {
						hasMatch.update(with:matchedString)
						moduleDependencies[moduleName] = hasMatch
						mainLogger.debug("adding dependency '\(matchedString)' to module '\(moduleName)'.")
					} else {
						moduleDependencies[moduleName] = [matchedString]
					}
				}
			}
		}

		var moduleBuild = [String:BoostSourceModule]()
		for moduleName in allModuleNames {
			let hasSource = buildableTargets.contains(moduleName)
			let newModule = try await BoostSourceModule(boostdepListName:moduleName, hasSource:hasSource, basedIn:boostPath, dependencies:moduleDependencies[moduleName] ?? [],logger:mainLogger)
			moduleBuild[moduleName] = newModule
		}
		
		// create the modules directory if it doesn't exist
		if FileManager.default.fileExists(atPath:packBaseURL.appendingPathComponent("Modules").path) == false {
			mainLogger.info("creating modules directory...")
			try FileManager.default.createDirectory(at:packBaseURL.appendingPathComponent("Modules"), withIntermediateDirectories:true, attributes:nil)
		}

		// encode the boost source modules to the modules directory.
		let commitPackaged = [boostCheckout:moduleBuild]
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted 
		let encodedModules = try encoder.encode(commitPackaged)
		mainLogger.info("writing modules to disk...")
		try encodedModules.write(to:packBaseURL.appendingPathComponent("Modules").appendingPathComponent("boost-modules.json", isDirectory:false), options:.atomicWrite)
		mainLogger.info("done writing modules to disk.")
	}
}

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in:.whitespacesAndNewlines)
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

		let modulePath = URL(fileURLWithPath:moduleBase).appendingPathComponent(moduleName)

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