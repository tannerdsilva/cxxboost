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

		// target stuff
		let targetNameLabel = LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:self.source.packageName), trailingComma:.commaToken())
		let targetDependenciesLabel = LabeledExprSyntax(label:TokenSyntax.identifier("dependencies"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
			for (i, dependency) in self.primaryDepends.enumerated().reversed() {
				switch i {
					case 0:
						ArrayElementSyntax(expression:StringLiteralExprSyntax(content:dependency.packageName))
					default:
						ArrayElementSyntax(expression:StringLiteralExprSyntax(content:dependency.packageName))
				}
			}
		}), trailingComma:TokenSyntax.commaToken())
		let targetPathLabel = LabeledExprSyntax(label:TokenSyntax.identifier("path"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"./"), trailingComma:TokenSyntax.commaToken())
		let targetExcludesLabel = LabeledExprSyntax(label:TokenSyntax.identifier("exclude"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
			for curExclude in self.source.excludes {
				ArrayElementSyntax(expression:StringLiteralExprSyntax(content:curExclude))
			}
		}), trailingComma:TokenSyntax.commaToken())
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
		let publicHeadersPathLabel = LabeledExprSyntax(label:TokenSyntax.identifier("publicHeadersPath"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"include"), trailingComma:TokenSyntax.commaToken())
		let packageAccessLabel = LabeledExprSyntax(label:TokenSyntax.identifier("packageAccess"), colon:.colonToken(), expression:BooleanLiteralExprSyntax(booleanLiteral:false))
		
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
		}))
		let packageArgumentList = LabeledExprListSyntax {
			packageNameLabel
			Self.packagePlatforms
			packageProductsLabel
			packageDependenciesLabel
			targetLabel
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