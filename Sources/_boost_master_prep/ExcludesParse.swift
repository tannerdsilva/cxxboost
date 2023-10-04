// import ArgumentParser
// import SwiftSlash
// import Foundation
import Logging
import SwiftParser
import SwiftSyntax

extension SourceFileSyntax {
	struct NotFound:Swift.Error {}
	func parseExcludesConfig(logger:Logger) throws -> [String:ArrayExprSyntax] {

		logger.debug("searching through \(statements.count) statements in source file.")
		
		for statement in self.statements {
			switch statement.item {
				// there should be only one declaration in the file, and this should be it
				case let .decl(thisDecl):

					logger.debug("decl found. determining if this is the configuration.")

					if let asVarDecl = thisDecl.as(VariableDeclSyntax.self) {
						logger.debug("variable declaration found. determining if this is the configuration.")
						
						// let is required
						guard asVarDecl.bindingSpecifier.text == "let" else {
							logger.debug("binding specifier is not let.")
							continue
						}
						// allow only one binding
						guard asVarDecl.bindings.count == 1 else {
							logger.debug("binding count is not 1.")
							continue
						}
						let firstBinding = asVarDecl.bindings.first!

						// validate the binding pattern, it must have the right identifier and stuff
						guard let patternPat = firstBinding.pattern.as(IdentifierPatternSyntax.self), patternPat.identifier.text == "packageExcludes" else {
							logger.debug("binding pattern identifier is not packageConditions.")
							continue
						}
						guard let dictExpr = firstBinding.initializer?.value.as(DictionaryExprSyntax.self), let dictContent = dictExpr.content.as(DictionaryElementListSyntax.self) else {
							logger.debug("initializer is not a dictionary expression.")
							continue
						}
						var packageConditions:[String:ArrayExprSyntax] = [:]
						for dictElement in dictContent {
							guard let keyExpr = dictElement.key.as(StringLiteralExprSyntax.self), let asStringLiteral = keyExpr.segments.first?.as(StringSegmentSyntax.self) else {
								logger.debug("keys in the dictionary must be a string literal")
								continue
							}
							let key = asStringLiteral.content.text
							guard let valueExpr = dictElement.value.as(ArrayExprSyntax.self) else {
								continue
							}
							packageConditions[key] = valueExpr
						}
						logger.info("returning package exceptions: \(packageConditions.count)")
						return packageConditions
					}
					continue
				default:
				continue
			}
		}
		throw NotFound()
	}
}
