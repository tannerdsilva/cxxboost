import Logging
import SwiftParser
import SwiftSyntax
import Foundation

extension CodeBlockItemListSyntax {
	// determine if the item list contains conditional blocks
	fileprivate func parseForConditionalCode(logger:Logger) -> [CodeBlockItemListSyntax]? {
		for item in self {
			switch item.item {
				case let .decl(thisDecl):
					if let asIfDecl = thisDecl.as(IfConfigDeclSyntax.self) {
						let condition = asIfDecl.clauses
						guard condition.last!.poundKeyword == .poundElseToken() else {
							logger.error("invalid conditional block. must end with else.")
							continue
						}
						return condition.compactMap { $0.as(CodeBlockItemListSyntax.self) ?? nil }
					}
				default:
				break;
			}
		}
		return nil
	}
}

extension CodeBlockItemSyntax {
	fileprivate func parsePackageDescriptionName(logger:Logger, expectedPackagePrefix:String) -> String? {
		guard let asVarDecl = self.item.as(VariableDeclSyntax.self) else {
			return nil
		}
		guard asVarDecl.bindingSpecifier.text == "let" else {
			logger.error("invalid package variable specifier")
			return nil
		}
		guard asVarDecl.bindings.count == 1 else {
			logger.error("invalid package variable count")
			return nil
		}
		let firstBinding = asVarDecl.bindings.first!
		guard	let patternPat = firstBinding.pattern.as(IdentifierPatternSyntax.self),
				patternPat.identifier.text == "package" else {
			logger.error("invalid package variable name")
			return nil
		}
		guard 	let functionCalls = firstBinding.initializer?.value.as(FunctionCallExprSyntax.self), 
				let packageReferenceDecl = functionCalls.calledExpression.as(DeclReferenceExprSyntax.self),
				packageReferenceDecl.baseName.text == "Package" else {
			logger.error("invalid package reference name")
			return nil
		}
		
		// parse the relevant arguments from the package declaration call
		for curArg in functionCalls.arguments {
			guard let argLabel = curArg.label?.text else {
				logger.error("invalid package argument label")
				return nil
			}
			switch argLabel {
				case "name":
					guard	let nameLiteral = curArg.expression.as(StringLiteralExprSyntax.self),
							let nameSegments = nameLiteral.segments.as(StringLiteralSegmentListSyntax.self),
							nameSegments.count == 1,
							let firstNameSegmet = nameSegments.first!.as(StringSegmentSyntax.self) else {
						logger.error("invalid package name literal")
						return nil
					}
					let packageName = firstNameSegmet.content.text
					guard packageName.hasPrefix(expectedPackagePrefix) else {
						logger.error("invalid package name prefix")
						return nil
					}
					return packageName
				default:
					continue
			}
		}
		return nil
	}
}

extension SourceFileSyntax {
	fileprivate struct InconsistentPackageNames:Swift.Error {
		let allPackageNames:Set<String>
		init(_ allPackageNames:Set<String>) {
			self.allPackageNames = allPackageNames
		}
	}
	fileprivate struct NoPackageFound:Swift.Error {}
	fileprivate func parsePackageConfigurationName(logger:Logger, expectedPackagePrefix:String) throws -> String {
		if let hasConditionalCodeBlocks = statements.parseForConditionalCode(logger:logger) {
			var identifiedNames = Set<String>()
			for curBlock in hasConditionalCodeBlocks {
				for curItem in curBlock {
					if let packageName = curItem.parsePackageDescriptionName(logger:logger, expectedPackagePrefix:expectedPackagePrefix) {
						logger.info("found package name: '\(packageName)'")
						identifiedNames.update(with:packageName)
					}
				}
			}
			guard identifiedNames.count == 1 else {
				throw InconsistentPackageNames(identifiedNames)
			}
			return identifiedNames.first!
		} else {
			for curItem in statements {
				if let packageName = curItem.parsePackageDescriptionName(logger:logger, expectedPackagePrefix:expectedPackagePrefix) {
					return packageName
				}
			}
			throw NoPackageFound()
		}
	}
}

struct Module {
	enum Name {
		case flatName(String)
		case layeredName(String, String)

		var boostdepName:String {
			get {
				switch self {
					case let .flatName(name):
						return name
					case let .layeredName(name, subname):
						return "\(name)~\(subname)"
				}
			}
		}

		var swiftPackageName:String {
			get {
				switch self {
					case let .flatName(name):
						return name
					case let .layeredName(name, subname):
						return "\(name)-\(subname)"
				}
			}
		}
	}

	let logger:Logger
	let packageName:Name

	init(logger:Logger, boostdepName:String, packagePath:URL)  {
		self.logger = logger
		if boostdepName.contains("~") {
			let parts = boostdepName.split(separator:"~")
			guard parts.count == 2 else {
				fatalError("invalid package name")
			}
			self.packageName = .layeredName(String(parts[0]), String(parts[1]))
		} else {
			self.packageName = .flatName(boostdepName)
		}
	}
}