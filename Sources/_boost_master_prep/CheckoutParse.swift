// import ArgumentParser
// import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax

extension SourceFileSyntax {
	fileprivate struct CheckoutValueNotFound:Swift.Error {}
	fileprivate func parseCheckoutValue(logger:Logger) throws -> String {

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
						guard let patternPat = firstBinding.pattern.as(IdentifierPatternSyntax.self), patternPat.identifier.text == "boostCheckout" else {
							logger.debug("binding pattern identifier is not packageConditions.")
							continue
						}
						guard let checkoutTag = firstBinding.initializer?.value.as(StringLiteralExprSyntax.self), let firstSegment = checkoutTag.segments.first?.as(StringSegmentSyntax.self) else {
							logger.debug("initializer is not a dictionary expression.")
							continue
						}
						return firstSegment.content.text
					}
					continue
				default:
				continue
			}
		}
		throw CheckoutValueNotFound()
	}
}

internal func parsePackageCheckoutValue(logger:Logger, packageURL:URL) throws -> String {
	let asURL = packageURL.appendingPathComponent("BoostCheckout.swift")
	logger.trace("attempting to read file '\(asURL.path)'")
	let readData = try Data(contentsOf:asURL)
	logger.trace("read \(readData.count) bytes from file.")
	let readString = String(data:readData, encoding:.utf8)!
	logger.trace("parsing swift syntax for checkout value...")
	let syntaxParser = Parser.parse(source:readString)
	let parsedValue = try syntaxParser.parseCheckoutValue(logger:logger)
	logger.trace("parsed checkout value: \(parsedValue)")
	return parsedValue
}