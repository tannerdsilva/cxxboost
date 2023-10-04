import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftParser
import Foundation

extension PackageDescriptionWithDependencies {
	fileprivate static let macOSPlatformLine = FunctionCallExprSyntax(calledExpression:MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("macOS"))), leftParen:TokenSyntax.leftParenToken(), arguments:[
		LabeledExprSyntax(expression:MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("v13")))),
	], rightParen:TokenSyntax.rightParenToken())
	fileprivate static let packagePlatforms = LabeledExprSyntax(label:TokenSyntax.identifier("platforms"), colon:.colonToken(), expression:ArrayExprSyntax(elements:[
		ArrayElementSyntax(expression:macOSPlatformLine)
	]))
	func generatePackageDescriptionSourceCode() -> SourceFileSyntax {
		let packageNameLabel = LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:TokenSyntax.colonToken(), expression:StringLiteralExprSyntax(content:self.source.packageName), trailingComma:TokenSyntax.commaToken())
		let packageProductsLabel = LabeledExprSyntax(label:TokenSyntax.identifier("products"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
			ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("library"))), leftParen:TokenSyntax.leftParenToken(), arguments:[
				LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:self.source.packageName), trailingComma:.commaToken()),
				LabeledExprSyntax(label:TokenSyntax.identifier("targets"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
					ArrayElementSyntax(expression:StringLiteralExprSyntax(content:self.source.packageName))
				}))
			], rightParen:TokenSyntax.rightParenToken()))
		}))
		let packageDependenciesLabel = LabeledExprSyntax(label:TokenSyntax.identifier("dependencies"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
			for (i, dependency) in self.primaryDepends.enumerated().reversed() {
				ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("package"))), leftParen:TokenSyntax.leftParenToken(), arguments:[
					LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:dependency.packageName), trailingComma:.commaToken()),
					LabeledExprSyntax(label:TokenSyntax.identifier("path"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"../" + dependency.packageName))
				], rightParen:TokenSyntax.rightParenToken()), trailingComma:(i == 0 ? nil : TokenSyntax.commaToken()))
			}
		}))

		let targetLabel = LabeledExprSyntax(label:TokenSyntax.identifier("targets"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
			ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("target"))), leftParen:TokenSyntax.leftParenToken(), arguments:[
				targetNameLabel,
				targetDependenciesLabel,
				targetPathLabel,
				targetExcludesLabel,
				targetSourcesLabel,
				publicHeadersPathLabel,
				packageAccessLabel
			], rightParen:TokenSyntax.rightParenToken()))
		}), trailingComma:TokenSyntax.commaToken())
		let cxxVersionLabel = LabeledExprSyntax(label:TokenSyntax.identifier("cxxLanguageStandard"), colon:.colonToken(), expression:MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("cxx14"))))
		let packageArgumentList = LabeledExprListSyntax {
			packageNameLabel
			Self.packagePlatforms
			packageProductsLabel
			packageDependenciesLabel
			targetLabel
			cxxVersionLabel
		}
		let packageInitFunctionCall = FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("Package")), leftParen:TokenSyntax.leftParenToken(), arguments:packageArgumentList, rightParen:TokenSyntax.rightParenToken())
		let patternInit = PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("package")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("Package")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:packageInitFunctionCall))
		let patternInitList = PatternBindingListSyntax([patternInit])
		let packageVariable = VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax(), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:patternInitList)
		return SourceFileSyntax {
			CodeBlockItemListSyntax {
				ImportDeclSyntax(leadingTrivia:Trivia.lineComment("// swift-tools-version: 5.9\n"), attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax(), importKeyword:TokenSyntax.keyword(.`import`), path:ImportPathComponentListSyntax([
					ImportPathComponentSyntax(name:TokenSyntax.identifier("PackageDescription"))
				]), trailingTrivia:Trivia.newlines(1))
				CodeBlockItemListSyntax {
					packageVariable
				}
			}
			
		}
	}
}

extension BoostSourceModule {
	func generateTargetDependencyLine() {
		let windowsDecl = DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("windows"))
		let windowsAccess = MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:windowsDecl)
		let windowsArray = ArrayElementListSyntax(ArrayElementSyntax(windowsAccess))!
		let platformsArraySyntax = ArrayExprSyntax(leftSquare:TokenSyntax.leftSquareToken(), elements:windowsArray, rightSquare:TokenSyntax.rightSquareToken())
		let platformsLabelExpression = LabeledExprListSyntax(LabeledExprSyntax(label:TokenSyntax.identifier("platforms"), colon:TokenSyntax.colonToken(), expression:platformsArraySyntax))!

		let whenDeclRef = DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("when"))
		let whenAccess = MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:whenDeclRef)

		let whenCondition = FunctionCallExprSyntax(calledExpression:whenAccess, leftParen:TokenSyntax.leftParenToken(), arguments:platformsLabelExpression, rightParen:TokenSyntax.rightParenToken())
	
	}
}


// struct ExistingModulePackageDescription {
// 	let parsedName:String
// 	let parsedPlatforms:ArrayExprSyntax
// 	let parsedProducts:ArrayExprSyntax
// 	let parsedDependencies:ArrayExprSyntax
// 	let parsedTargets:ArrayExprSyntax

// 	init(from:String) {
// 		let parsed = Parser.parse(source:from)
// 		let package = parsed.statements.first! as! CodeBlockItemListSyntax
// 		let packageDescription = package.first! as! CodeBlockItemSyntax
// 	}
// }

/*
TokenSyntax.keyword(Keyword.import)
	ImportPathComponentListSyntax {
		ImportPathComponentSyntax {
			TokenSyntax.identifier("PackageDescription")
		}
	}
*/