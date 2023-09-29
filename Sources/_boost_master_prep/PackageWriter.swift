import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftParser
import Foundation

extension PackageDescriptionWithDependencies {
	func generatePackageDescription() -> CodeBlockItemListSyntax {
		return CodeBlockItemListSyntax {
			VariableDeclSyntax(bindingSpecifier:.equalToken(), bindings:[
				// list the package parameters
				PatternBindingSyntax(pattern:PatternSyntax(IdentifierPatternSyntax(identifier:"package")), typeAnnotation:TypeAnnotationSyntax(type:TypeSyntax("Package")), initializer:InitializerClauseSyntax(value:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"package"), arguments:LabeledExprListSyntax {
					// package name
					LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:TokenSyntax.colonToken(), expression:StringLiteralExprSyntax(content:self.source.packageName))
					// package platforms
					LabeledExprSyntax(label:TokenSyntax.identifier("platforms"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
						ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"Platform"), arguments:LabeledExprListSyntax {
							LabeledExprSyntax(label:TokenSyntax.identifier("macOS"), colon:.colonToken(), expression:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"Platform"), arguments:LabeledExprListSyntax {
								LabeledExprSyntax(label:TokenSyntax.identifier("version"), colon:.colonToken(), expression:ExprSyntax("v13"))
							}))
						}))
					}))
					// package products (actually only one product)
					LabeledExprSyntax(label:TokenSyntax.identifier("products"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
						ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"Product"), arguments:LabeledExprListSyntax {
							LabeledExprSyntax(label:TokenSyntax.identifier("library"), colon:.colonToken(), expression:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"Product"), arguments:LabeledExprListSyntax {
								// product name
								LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:self.source.packageName))
								// product targets
								LabeledExprSyntax(label:TokenSyntax.identifier("targets"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
									ArrayElementSyntax(expression:StringLiteralExprSyntax(content:self.source.packageName))
								}))
							}))
						}))
					}))
					// package dependencies
					LabeledExprSyntax(label:TokenSyntax.identifier("dependencies"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
						for (i, dependency) in self.primaryDepends.enumerated().reversed() {
							ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"PackageDependency"), arguments:LabeledExprListSyntax {
								LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:dependency.packageName), trailingComma:.commaToken())
								LabeledExprSyntax(label:TokenSyntax.identifier("path"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"../" + dependency.packageName))
							}), trailingComma:(i == 0 ? nil : .commaToken()))
						}
					}))
					// package targets
					LabeledExprSyntax(label:TokenSyntax.identifier("targets"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
						ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"Target"), arguments:LabeledExprListSyntax {
							// target name
							LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:self.source.packageName))
							// target dependencies
							LabeledExprSyntax(label:TokenSyntax.identifier("dependencies"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
								for (i, dependency) in self.primaryDepends.enumerated().reversed() {
									ArrayElementSyntax(expression:FunctionCallExprSyntax(calledExpression:DeclReferenceExprSyntax(baseName:"Target.Dependency"), arguments:LabeledExprListSyntax {
										LabeledExprSyntax(label:TokenSyntax.identifier("target"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:dependency.packageName), trailingComma:.commaToken())
									}), trailingComma:(i == 0 ? nil : .commaToken()))
								}
							}))
							// target path
							LabeledExprSyntax(label:TokenSyntax.identifier("path"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"Sources"))
							// target excludes
							LabeledExprSyntax(label:TokenSyntax.identifier("exclude"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
								for curExclude in self.source.excludes {
									ArrayElementSyntax(expression:StringLiteralExprSyntax(content:curExclude))
								}
							}))
							// target sources
							if self.source.hasSource == true {
								// enable the source directory
								LabeledExprSyntax(label:TokenSyntax.identifier("sources"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {
									ArrayElementSyntax(expression:StringLiteralExprSyntax(content:"src"))
								}))
							} else {
								// explicitly empty source directory
								LabeledExprSyntax(label:TokenSyntax.identifier("sources"), colon:.colonToken(), expression:ArrayExprSyntax(elements:ArrayElementListSyntax {}))
							}
							// define the public headers
							LabeledExprSyntax(label:TokenSyntax.identifier("publicHeadersPath"), colon:.colonToken(), expression:StringLiteralExprSyntax(content:"include"))
							// disable package access
							LabeledExprSyntax(label:TokenSyntax.identifier("packageAccess"), colon:.colonToken(), expression:BooleanLiteralExprSyntax(booleanLiteral:false))
						}))
					}))
				})))
			])
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