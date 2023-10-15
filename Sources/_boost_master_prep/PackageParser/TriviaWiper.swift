import Foundation
import Logging
import SwiftParser
import SwiftSyntax

internal class TriviaWiper:SyntaxRewriter {
	let logger:Logger

	init(log:Logger) { 
		self.logger = log
		super.init(viewMode:.sourceAccurate)
	}

	override func visit(_ node:TokenSyntax) -> TokenSyntax {
		return TokenSyntax(node.tokenKind, leadingTrivia:Trivia(), trailingTrivia:Trivia(), presence:node.presence)
	}

	override func visit(_ node:IfConfigDeclSyntax) -> DeclSyntax { 
		return DeclSyntax(IfConfigDeclSyntax(clauses:self.visit(node.clauses), poundEndif:TokenSyntax.poundEndifToken()))
	}

	override func visit(_ node:IfConfigClauseListSyntax) -> IfConfigClauseListSyntax {
		var ifcc = IfConfigClauseListSyntax()
		for curElement in node {
			let condition:ExprSyntax?
			if let hasCondition = curElement.condition {
				condition = self.visit(hasCondition)
			} else {
				condition = nil
			}

			let elements:IfConfigClauseSyntax.Elements?
			if let hasElements = curElement.elements {
				elements = self.visit(hasElements)
			} else {
				elements = nil
			}
			ifcc.append(IfConfigClauseSyntax(poundKeyword:self.visit(curElement.poundKeyword), condition:condition, elements:elements))
		}
		return ifcc
	}

	override func visit(_ node:StringLiteralExprSyntax) -> ExprSyntax {
		return ExprSyntax(StringLiteralExprSyntax(openingQuote:TokenSyntax.stringQuoteToken(), segments:self.visit(node.segments), closingQuote:TokenSyntax.stringQuoteToken()))
	}

	override func visit(_ node:FunctionCallExprSyntax) -> ExprSyntax {
		return ExprSyntax(FunctionCallExprSyntax(calledExpression:self.visit(node.calledExpression), leftParen:TokenSyntax.leftParenToken(), arguments:self.visit(node.arguments), rightParen:TokenSyntax.rightParenToken()))
	}
	override func visit(_ node:MemberAccessExprSyntax) -> ExprSyntax {
		let assignBase:ExprSyntax?
		if let hasBase = node.base {
			assignBase = self.visit(hasBase)
		} else {
			assignBase = nil
		}
		return ExprSyntax(MemberAccessExprSyntax(base:assignBase, period:TokenSyntax.periodToken(), declName:node.declName))
	}
	override func visit(_ node:ArrayExprSyntax) -> ExprSyntax {
		let indented = self.visit(node.elements)
		return ExprSyntax(ArrayExprSyntax(leftSquare:TokenSyntax.leftSquareToken(), elements:indented, rightSquare:TokenSyntax.rightSquareToken()))
	}
	override func visit(_ node:ArrayElementListSyntax) -> ArrayElementListSyntax {
		var buildNewList = ArrayElementListSyntax()
		for (i, curElement) in node.enumerated().reversed() {
			var arElement = ArrayElementSyntax(expression:self.visit(curElement.expression))
			if i != 0 {
				arElement.trailingComma = TokenSyntax.commaToken()
			}
			buildNewList.append(arElement)
		}
		return buildNewList
	}
	override func visit(_ node:LabeledExprListSyntax) -> LabeledExprListSyntax {
		var buildNewList = LabeledExprListSyntax()
		for (i, curElement) in node.reversed().enumerated() {
			var labelPick:TokenSyntax?
			if let hasLabel = curElement.label {
				labelPick = self.visit(hasLabel)
			} else {
				labelPick = nil
			}
			var colonPick:TokenSyntax?
			if let hasColon = curElement.colon {
				colonPick = self.visit(hasColon)
				colonPick?.leadingTrivia = Trivia()
				colonPick?.trailingTrivia = Trivia()
			} else {
				colonPick = nil
			}

			let trailingCommaPick:TokenSyntax?
			if i == 0 {
				trailingCommaPick = nil
			} else {
				trailingCommaPick = TokenSyntax.commaToken()
			}
			buildNewList.insert(LabeledExprSyntax(label:labelPick, colon:colonPick, expression:self.visit(curElement.expression), trailingComma:trailingCommaPick), at:buildNewList.startIndex)
		}
		return buildNewList
	}
	override func visit(_ node:LabeledExprSyntax) -> LabeledExprSyntax {
		let colonPick:TokenSyntax?
		if let hasColon = node.colon {
			colonPick = self.visit(hasColon)
		} else {
			colonPick = nil
		}
		let labelPick:TokenSyntax?
		if let hasLabel = node.label {
			labelPick = self.visit(hasLabel)
		} else {
			labelPick = nil
		}
		let trailingCommaPick:TokenSyntax?
		if let hasTrailingComma = node.trailingComma {
			trailingCommaPick = self.visit(hasTrailingComma)
		} else {
			trailingCommaPick = nil
		}
		return LabeledExprSyntax(label:labelPick, colon:colonPick, expression:self.visit(node.expression), trailingComma:trailingCommaPick)
	}
}