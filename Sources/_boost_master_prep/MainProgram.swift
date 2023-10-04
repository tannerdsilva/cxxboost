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
			// BoostdepBuilder.self,
			PrepareBoostSource.self,
			ParseConditions.self,
		]
	)
}

struct ConditionsReader {
	let conditions:Dictionary<String, ArrayExprSyntax>
	init(packageURL:URL) throws {
		var myLogger = Logger(label:"boost-build-plugin")
		myLogger.logLevel = .info
		let asURL = packageURL.appendingPathComponent("Conditions.swift")
		let readData = try Data(contentsOf:asURL)
		let readString = String(data:readData, encoding:.utf8)!
		let syntaxParser = Parser.parse(source:readString)
		let allExceptions = try syntaxParser.parseExcludesConfig(logger:myLogger)
		self.conditions = allExceptions
	}
}

struct ParseConditions:AsyncParsableCommand {
	static let configuration = CommandConfiguration(
		commandName:"parse-conditions",
		abstract:"parses the conditions.swift file and generates a package.swift file."
	)

	@Argument(help:"the path to the conditions.swift file.")
	var conditionsFilePath:String

	mutating func run() async throws {
		var myLogger = Logger(label:"boost-build-plugin")
		myLogger.logLevel = .trace
		let asURL = URL(fileURLWithPath:conditionsFilePath)

		let readData = try Data(contentsOf:asURL)
		let readString = String(data:readData, encoding:.utf8)!


		let syntaxParser = Parser.parse(source:readString)
		let myThing = try syntaxParser.parseExcludesConfig(logger:myLogger)
		
	}
}


// represents a module in the boost source code.
struct BoostSourceModule:Hashable {

	enum ModuleMapHeader:Hashable, Equatable {
		case headerFile(String)
		case headerDirectory(String)
	}

	// this is used to match the module names from the loose structure of boostdep output
	static func processInputName(_ inputName:String, basedIn base:URL) -> (String, String, URL) {
		if inputName.hasPrefix("numeric~") == true {
			return (inputName, "cxxboost_" + inputName.replacingOccurrences(of:"~", with: "-"), base.appendingPathComponent("libs").appendingPathComponent("numeric").appendingPathComponent(inputName.replacingOccurrences(of:"numeric~", with:"")))
		} else {
			return (inputName, "cxxboost_" + inputName, base.appendingPathComponent("libs").appendingPathComponent(inputName))
		}
	}

	// the name of the module as provided by the boostdep output
	let boostdepName:String

	// the name of the module as it will be used in the swift package
	let packageName:String

	// the path to the source code of this module
	let basePath:URL

	// the excludes for this module
	let includeHeaders:[ModuleMapHeader]

	// indicates whether or not this module has source code
	var hasSource:Bool

	// the excludes for this module
	let excludesArr:ArrayExprSyntax?

	init(boostdepListName:String, hasSource:Bool, basedIn base:URL, excludesArrs:[String:ArrayExprSyntax]?, logger:Logger) throws {
		// determine the name of the module and its location
		let (boostName, ourName, path) = Self.processInputName(boostdepListName, basedIn:base)
		
		self.boostdepName = boostName
		self.packageName = ourName
		self.basePath = path
		self.hasSource = hasSource
		self.excludesArr = excludesArrs?[ourName]
		
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
		let sourceSourceDir = path.appendingPathComponent("src", isDirectory:true)

		// determine if the module directory exists
		guard FileManager.default.fileExists(atPath:path.path) else {
			throw ValidationError(message:"the module '\(path.path)' does not exist.")
		}
	}

	func generateTargetDependencyLine() -> FunctionCallExprSyntax {
		let declRefExpr = DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("product"))
		let memberAccessExpr = MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:declRefExpr)

		let nameLabel = LabeledExprSyntax(label:"name", colon:TokenSyntax.colonToken(), expression:StringLiteralExprSyntax(content:self.packageName), trailingComma:TokenSyntax.commaToken())
		let packageLabel = LabeledExprSyntax(label:"package", colon:TokenSyntax.colonToken(), expression:StringLiteralExprSyntax(content:"_boost_master_prep"), trailingComma:TokenSyntax.commaToken())
	
		let labeledList = LabeledExprListSyntax([
			nameLabel,
			packageLabel
		])

		return FunctionCallExprSyntax(calledExpression:memberAccessExpr, leftParen:TokenSyntax.leftParenToken(), arguments:labeledList, rightParen:TokenSyntax.rightParenToken(), trailingClosure:nil)
	}

	func generateModuleMapContents() -> String {
		var moduleMapContent = "module \(self.packageName) [system] {\n"
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
}

struct PackageDescriptionWithDependencies {
	let source:BoostSourceModule
	let primaryDepends:[BoostSourceModule]

	let targetNameLabel:LabeledExprSyntax
	let targetDependenciesLabel:LabeledExprSyntax
	let targetPathLabel:LabeledExprSyntax
	let targetExcludesLabel:LabeledExprSyntax
	let targetSourcesLabel:LabeledExprSyntax
	let publicHeadersPathLabel:LabeledExprSyntax
	let packageAccessLabel:LabeledExprSyntax

	init(source:BoostSourceModule, primaryDepends:[BoostSourceModule], loadedExcludes:[String:ArrayExprSyntax]) {
		self.source = source
		self.primaryDepends = primaryDepends

		// target stuff
		self.targetNameLabel = LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:self.source.packageName), trailingComma:.commaToken())
		self.targetDependenciesLabel = LabeledExprSyntax(label:TokenSyntax.identifier("dependencies"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
			for (i, dependency) in primaryDepends.enumerated().reversed() {
				switch i {
					case 0:
						ArrayElementSyntax(expression:StringLiteralExprSyntax(content:dependency.packageName))
					default:
						ArrayElementSyntax(expression:StringLiteralExprSyntax(content:dependency.packageName))
				}
			}
		}), trailingComma:TokenSyntax.commaToken())
		self.targetPathLabel = LabeledExprSyntax(label:TokenSyntax.identifier("path"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"./"), trailingComma:TokenSyntax.commaToken())
		self.targetExcludesLabel = LabeledExprSyntax(label:TokenSyntax.identifier("exclude"), colon:.colonToken(), expression:loadedExcludes[source.packageName] ?? ArrayExprSyntax(expressions: []), trailingComma:TokenSyntax.commaToken())
		let targetSourcesLabel:LabeledExprSyntax
		if (self.source.hasSource == true) {
			// enable the source directory
			targetSourcesLabel = LabeledExprSyntax(label:TokenSyntax.identifier("sources"), colon:.colonToken(), expression:ArrayExprSyntax(elements:[
				ArrayElementSyntax(expression:StringLiteralExprSyntax(content:"src"))
			]), trailingComma:TokenSyntax.commaToken())
		} else {
			// explicitly empty source directory
			targetSourcesLabel = LabeledExprSyntax(label:TokenSyntax.identifier("sources"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {}), trailingComma:TokenSyntax.commaToken())
		}
		self.targetSourcesLabel = targetSourcesLabel
		self.publicHeadersPathLabel = LabeledExprSyntax(label:TokenSyntax.identifier("publicHeadersPath"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"include"), trailingComma:TokenSyntax.commaToken())
		self.packageAccessLabel = LabeledExprSyntax(label:TokenSyntax.identifier("packageAccess"), colon:.colonToken(), expression:BooleanLiteralExprSyntax(booleanLiteral:false))
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

	@Argument(help:"the commit hash or tag to checkout and prepare")
	var boostCheckout:String

	@Flag(help:"indicates whether or not to clean the build directory before building.")
	var cleanBuild:Bool = false

	mutating func run() async throws {
		var mainLogger = Logger(label:"boost-build-plugin")
		mainLogger.logLevel = .trace

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

		// remove any of the current boost source code
		if (cleanBuild == true) {
			if FileManager.default.fileExists(atPath:boostPath.path) {
				try FileManager.default.removeItem(atPath:boostPath.path)
			}
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

		let condReader = try ConditionsReader(packageURL:URL(fileURLWithPath:packageBase))
		let packageConditions = condReader.conditions
		
		var moduleBuild = [String:BoostSourceModule]()
		for moduleName in allModuleNames {
			let hasSource = buildableTargets.contains(moduleName)
			let newModule = try BoostSourceModule(boostdepListName:moduleName, hasSource:hasSource, basedIn:boostPath, excludesArrs:packageConditions, logger:mainLogger)
			moduleBuild[moduleName] = newModule
		}

		var moduleDependencies:[String:Set<BoostSourceModule>] = [:]
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
						hasMatch.update(with:moduleBuild[matchedString]!)
						moduleDependencies[moduleName] = hasMatch
						mainLogger.debug("adding dependency '\(matchedString)' to module '\(moduleName)'.")
					} else {
						moduleDependencies[moduleName] = [moduleBuild[matchedString]!]
					}
				}
			}
		}

		// write the package.swift files
		let moduleDirectory = URL(fileURLWithPath:packageBase).appendingPathComponent("Modules")
		for curPackage in moduleBuild {
			let currentModulePath = moduleDirectory.appendingPathComponent(curPackage.value.packageName)
			let packageDescription = PackageDescriptionWithDependencies(source:curPackage.value, primaryDepends:Array(moduleDependencies[curPackage.key] ?? []), loadedExcludes:packageConditions)
			let source = packageDescription.generatePackageDescriptionSourceCode()
			let formattedString = source.formatted().description

			// create the directory if it does not exist
			if FileManager.default.fileExists(atPath:currentModulePath.path) == false {
				mainLogger.info("creating directory '\(currentModulePath.path)'...")
				try FileManager.default.createDirectory(at:currentModulePath, withIntermediateDirectories:true, attributes:nil)
			}
			mainLogger.info("writing package description for module '\(curPackage.value.packageName)'...")
			try formattedString.write(to:currentModulePath.appendingPathComponent("Package.swift"), atomically:true, encoding:.utf8)

			// create the symbolic links for the include directory
			let boostSourceModulePath = curPackage.value.basePath

			// remove the old symbolic links
			let sourceIncludePath = boostSourceModulePath.appendingPathComponent("include")
			let boostPackageIncludePath = currentModulePath.appendingPathComponent("include")
			if FileManager.default.fileExists(atPath:boostPackageIncludePath.path) == false {
				mainLogger.info("creating include directory for module '\(curPackage.value.packageName)'...")
				try FileManager.default.createDirectory(at:boostPackageIncludePath, withIntermediateDirectories:true)
			}
			try FileManager.default.createSymbolicLink(at:boostPackageIncludePath.appendingPathComponent("boost"), withDestinationURL:sourceIncludePath.appendingPathComponent("boost"))
			mainLogger.info("created symbolic link for include directory.", metadata:["source":"\(sourceIncludePath.path)", "destination":"\(boostPackageIncludePath.path)"])
			
			// create the symbolic links for the source directory (if the module has source)
			if curPackage.value.hasSource == true {
				let sourceSourcePath = boostSourceModulePath.appendingPathComponent("src")
				let boostPackageSourcePath = currentModulePath.appendingPathComponent("src")
				if FileManager.default.fileExists(atPath:boostPackageSourcePath.path) {
					mainLogger.info("removing old source directory for module '\(curPackage.value.packageName)'...")
					try FileManager.default.removeItem(at:boostPackageSourcePath)
				}
				try FileManager.default.createSymbolicLink(at:boostPackageSourcePath, withDestinationURL:sourceSourcePath)
				mainLogger.info("created symbolic link for the source directory.", metadata:["source":"\(sourceSourcePath.path)", "destination":"\(boostPackageSourcePath.path)"])
			}

			// write the modulemap
			let moduleMapContent = curPackage.value.generateModuleMapContents()
			try moduleMapContent.write(to:boostPackageIncludePath.appendingPathComponent("module.modulemap"), atomically:true, encoding:.utf8)
		}
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