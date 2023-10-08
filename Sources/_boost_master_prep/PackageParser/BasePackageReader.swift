import Foundation
import Logging
import SwiftParser
import SwiftSyntax
import SwiftBasicFormat

struct ParsedBasePackage {
	struct InvalidBasePackageError:Error {
		let message:String
	}
	let platforms:ArrayExprSyntax
	let dependencies:ArrayExprSyntax
	let targets:ArrayExprSyntax
	let cxxLanguageStandard:MemberAccessExprSyntax

	fileprivate init(platforms:ArrayExprSyntax, dependencies:ArrayExprSyntax, targets:ArrayExprSyntax, cxxLanguageStandard:MemberAccessExprSyntax) {
		self.platforms = platforms
		self.dependencies = dependencies
		self.targets = targets
		self.cxxLanguageStandard = cxxLanguageStandard
	}

	static func load(log:Logger, packageDirectory:URL) throws -> ParsedBasePackage {
		let packageBaseURL = packageDirectory.appendingPathComponent("PackageBase.swift")
		let packageBaseSource = try String(contentsOf:packageBaseURL)
		let packageBaseSyntax = Parser.parse(source:packageBaseSource)
		var buildReturnValue:ParsedBasePackage? = nil
		let packageLocator = PackageDescriptionLocator(log:log, varName:"packageBase") { (packageDescription) in
			
			let makeFormatter = BasicFormat(indentationWidth:Trivia.tab)

			var foundPlatforms:ArrayExprSyntax? = nil
			let platformsLabelSeeker = PackageDescriptionLabeledVariableSeeker(log:log, labelName:"platforms", exprType:ArrayExprSyntax.self) { platformsArr in
				foundPlatforms = platformsArr.formatted(using:makeFormatter).as(ArrayExprSyntax.self)!
			}
			platformsLabelSeeker.walk(packageDescription)

			var foundDependencies:ArrayExprSyntax? = nil
			let dependenciesLabelSeeker = PackageDescriptionLabeledVariableSeeker(log:log, labelName:"dependencies", exprType:ArrayExprSyntax.self) { dependenciesArr in
				foundDependencies = dependenciesArr.formatted(using:makeFormatter).as(ArrayExprSyntax.self)!
			}
			dependenciesLabelSeeker.walk(packageDescription)

			var foundTargets:ArrayExprSyntax? = nil
			let targetsLabelSeeker = PackageDescriptionLabeledVariableSeeker(log:log, labelName:"targets", exprType:ArrayExprSyntax.self) { targetsArr in
				foundTargets = targetsArr.formatted(using:makeFormatter).as(ArrayExprSyntax.self)!
			}
			targetsLabelSeeker.walk(packageDescription)

			var foundCxxLanguageStandard:MemberAccessExprSyntax? = nil
			let cxxLanguageStandardLabelSeeker = PackageDescriptionLabeledVariableSeeker(log:log, labelName:"cxxLanguageStandard", exprType:MemberAccessExprSyntax.self) { cxxLanguageStandard in
				foundCxxLanguageStandard = cxxLanguageStandard.formatted(using:makeFormatter).as(MemberAccessExprSyntax.self)!
			}
			cxxLanguageStandardLabelSeeker.walk(packageDescription)

			if foundPlatforms != nil && foundDependencies != nil && foundTargets != nil && foundCxxLanguageStandard != nil {
				buildReturnValue = ParsedBasePackage(platforms:foundPlatforms!, dependencies:foundDependencies!, targets:foundTargets!, cxxLanguageStandard:foundCxxLanguageStandard!)
			}
		}

		packageLocator.walk(packageBaseSyntax)
		guard let returnValue = buildReturnValue else {
			throw InvalidBasePackageError(message:"unable to find all of the required variables in the package base.")
		}
		return returnValue
	}
}