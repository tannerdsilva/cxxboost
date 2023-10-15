import ArgumentParser
import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax

// scans a target expression for the target name
class PackageDescriptionTargetItemNameScanner:SyntaxVisitor {
	let whenFound:((String) -> Void)
	let logger:Logger
	let expectedTargetNamePrefix:String

	init(log:Logger, expectedTargetNamePrefix:String, _ whenFound:@escaping((String) -> Void)) {
		self.whenFound = whenFound
		self.logger = log
		self.expectedTargetNamePrefix = expectedTargetNamePrefix
		super.init(viewMode:.sourceAccurate)
	}

	override func visit(_ node:LabeledExprSyntax) -> SyntaxVisitorContinueKind {
		guard node.label?.text == "name" else {
			return .skipChildren
		}
		if let memberAccess = node.expression.as(MemberAccessExprSyntax.self), let declBaseName = memberAccess.base?.as(DeclReferenceExprSyntax.self) {
			let base = declBaseName.baseName.text
			if base.hasPrefix(self.expectedTargetNamePrefix) {
				whenFound(base)
			}
		} else if let stringLiteral = node.expression.as(StringLiteralExprSyntax.self) {
			let base = stringLiteral.segments.first!.as(StringSegmentSyntax.self)!.content.text
			if base.hasPrefix(self.expectedTargetNamePrefix) {
				logger.info("found target name '\(base)'.")
				whenFound(base)
			}
		}
		return .skipChildren
	}
}

// // scans an array for target expressions
// class PackageDescriptionTargetsArrayScanner:SyntaxVisitor {
// 	let whenFound:((LabeledExprListSyntax) -> Void)
// 	let logger:Logger
// 	let targetType:String

// 	init(log:Logger, targetType:String, _ whenFound:@escaping((LabeledExprListSyntax) -> Void)) {
// 		self.whenFound = whenFound
// 		self.logger = log
// 		self.targetType = targetType
// 		super.init(viewMode:.sourceAccurate)
// 	}

// 	override func visit(_ node:FunctionCallExprSyntax) -> SyntaxVisitorContinueKind {
// 		var logger = self.logger
// 		logger[metadataKey:"node_id"] = "\(node.description.hashValue)"
// 		logger[metadataKey:"node_type"] = "FunctionCallExprSyntax"
// 		logger.trace("visiting function call expression...")
// 		guard let declRefExpr = node.calledExpression.as(MemberAccessExprSyntax.self), declRefExpr.declName.baseName.text == self.targetType else {
// 			logger.debug("skipping function call expression because it is not a `.target` member.")
// 			return .skipChildren
// 		}
// 		whenFound(node.arguments)
// 		return .visitChildren
// 	}
// }

// // seeks one or more target labels in a package description
// class PackageDescriptionLabeledVariableSeeker<S:ExprSyntaxProtocol>:SyntaxVisitor {
// 	// this is used to match the module names from the loose structure of boostdep output
// 	let whenFound:((S) -> Void)
// 	let logger:Logger
// 	let type:S.Type
// 	let labelName:String

// 	init(log:Logger, labelName:String, exprType:S.Type, _ whenFound:@escaping((S) -> Void)) {
// 		self.whenFound = whenFound
// 		self.logger = log
// 		self.type = exprType
// 		self.labelName = labelName
// 		super.init(viewMode:.sourceAccurate)
// 	}

// 	override func visit(_ node:LabeledExprSyntax) -> SyntaxVisitorContinueKind {
// 		var logger = self.logger
// 		logger[metadataKey:"node_id"] = "\(node.description.hashValue)"
// 		logger[metadataKey:"node_type"] = "LebeledExprSyntax"
// 		logger.trace("visiting labeled expression...")
// 		guard node.label?.text == self.labelName else {
// 			logger.debug("skipping labeled expression because it is not a `\(self.labelName)` label.")
// 			return .skipChildren
// 		}
// 		guard let arrayExpr = node.expression.as(S.self) else {
// 			logger.debug("skipping labeled expression because it does not have an expression of the specified type.")
// 			return .skipChildren
// 		}
// 		logger.info("found '\(labelName)' label.")
// 		whenFound(arrayExpr)
// 		return .skipChildren
// 	}
// }




// // scans one or more target labels in a package description
// class PackageDescriptionLocator:SyntaxVisitor {
// 	let whenFound:((LabeledExprListSyntax) -> Void)
// 	let varName:String
// 	let logger:Logger

// 	init(log:Logger, varName:String, _ whenFound:@escaping((LabeledExprListSyntax) -> Void)) {
// 		self.whenFound = whenFound
// 		self.varName = varName
// 		self.logger = log
// 		super.init(viewMode:.sourceAccurate)
// 	}

// 	override func visit(_ node:VariableDeclSyntax) -> SyntaxVisitorContinueKind {
// 		var logger = self.logger
// 		logger[metadataKey:"node_id"] = "\(node.description.hashValue)"
// 		logger[metadataKey:"node_type"] = "VariableDeclSyntax"
// 		logger.trace("visiting variable declaration...")
// 		guard node.bindingSpecifier.text == "let" else {
// 			logger.debug("skipping variable declaration because it is not a `let` constant.")
// 			return .skipChildren
// 		}
// 		guard node.bindings.count == 1 else {
// 			logger.debug("skipping variable declaration because it has more than one binding.")
// 			return .skipChildren
// 		}
// 		guard let firstBinding = node.bindings.first?.as(PatternBindingSyntax.self) else {
// 			logger.debug("skipping variable declaration because it has no bindings.")
// 			return .skipChildren
// 		}

// 		// match the identifier pattern
// 		guard let patternPat = firstBinding.pattern.as(IdentifierPatternSyntax.self), patternPat.identifier.text == varName else {
// 			logger.debug("skipping variable declaration because it does not match the identifier pattern.")
// 			return .skipChildren
// 		}

// 		// dive into the initializer value
// 		guard let initializerValue = firstBinding.initializer?.value.as(FunctionCallExprSyntax.self) else {
// 			logger.debug("skipping variable declaration because it does not have a function call initializer.")
// 			return .skipChildren
// 		}

// 		// verify that the reference expression is correct
// 		guard let declRefExpr = initializerValue.calledExpression.as(DeclReferenceExprSyntax.self), declRefExpr.baseName.text == "Package" else {
// 			logger.debug("skipping variable declaration because it does not have a function call initializer.")
// 			return .skipChildren
// 		}

// 		logger.info("found package declaration.")
// 		whenFound(initializerValue.arguments)

// 		return .skipChildren
// 	}
// }
