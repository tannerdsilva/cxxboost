import Foundation
import Logging
import SwiftParser
import SwiftSyntax
import SwiftBasicFormat

internal class PackageDescriptionFormatter:BasicFormat {
	let logger:Logger
	
	init(log:Logger) {
		self.logger = log
		super.init(indentationWidth:Trivia.tab)
	}

	override func requiresNewline(between first: TokenSyntax?, and second: TokenSyntax?) -> Bool {
		switch (first?.tokenKind, second?.tokenKind) {
			case (.leftSquare, _):
				if first!.keyPathInParent == \ArrayExprSyntax.leftSquare, first!.parent!.as(ArrayExprSyntax.self)!.elements.count > 2 {
					return true
				} else {
					return false
				}
			case (_, .rightSquare):
				if second!.keyPathInParent == \ArrayExprSyntax.rightSquare, second!.parent!.as(ArrayExprSyntax.self)!.elements.count > 2 {
					return true
				} else {
					return false
				}
			case (.leftParen, _):
				if first!.keyPathInParent == \FunctionCallExprSyntax.leftParen, first!.parent!.as(FunctionCallExprSyntax.self)!.arguments.count > 3 {
					return true
				} else {
					return false
				}
			case (_, .rightParen):
				if second!.keyPathInParent == \FunctionCallExprSyntax.rightParen, second!.parent!.as(FunctionCallExprSyntax.self)!.arguments.count > 3 {
					return true
				} else {
					return false
				}
			case (.comma, _):
				if first!.keyPathInParent == \ArrayElementSyntax.trailingComma {
					if let asArrayElement = first!.parent!.as(ArrayElementSyntax.self), asArrayElement.parent!.as(ArrayElementListSyntax.self)!.count > 2 {
						return true
					} else {
						return false
					}
				} else if first!.keyPathInParent == \LabeledExprSyntax.trailingComma {
					if let asLabeledElement = first!.parent!.as(LabeledExprSyntax.self), asLabeledElement.parent!.as(LabeledExprListSyntax.self)!.count > 3 {
						return true
					} else {
						return false
					}
				}
				return super.requiresNewline(between:first, and:second)
			default:
				return super.requiresNewline(between:first, and:second)
		}
	}
}
