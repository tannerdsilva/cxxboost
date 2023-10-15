import ArgumentParser
import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax
import SwiftBasicFormat

// declarations of the various target labels used to describe a boost module within the package declaration
extension BoostSourceModule {
	var targetNameLabel:LabeledExprSyntax {
		LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:.colonToken(), expression:targetStruct4PackageNameMA, trailingComma:.commaToken())
	}
	var targetDependenciesLabel:LabeledExprSyntax {
		LabeledExprSyntax(label:TokenSyntax.identifier("dependencies"), colon:.colonToken(), expression:targetStruct4PackageDependenciesMA, trailingComma:TokenSyntax.commaToken())
	}
	var targetPathLabel:LabeledExprSyntax {
		LabeledExprSyntax(label:TokenSyntax.identifier("path"), colon:.colonToken(), expression:targetStruct4PackagePathMA, trailingComma:TokenSyntax.commaToken())
	}
	var targetExcludesLabel:LabeledExprSyntax {
		LabeledExprSyntax(label:TokenSyntax.identifier("exclude"), colon:.colonToken(), expression:targetStruct4PackageExcludesMA, trailingComma:TokenSyntax.commaToken())
	}
	var targetSourcesLabel:LabeledExprSyntax {
		LabeledExprSyntax(label:TokenSyntax.identifier("sources"), colon:.colonToken(), expression:targetStruct4PackageSourcesMA, trailingComma:TokenSyntax.commaToken())
	}
	var publicHeadersPathLabel:LabeledExprSyntax {
		LabeledExprSyntax(label:TokenSyntax.identifier("publicHeadersPath"), colon:.colonToken(), expression:targetStruct4PackagePublicHeadersPathMA, trailingComma:TokenSyntax.commaToken())
	}
	var packageAccessLabel:LabeledExprSyntax {
		LabeledExprSyntax(label:TokenSyntax.identifier("packageAccess"), colon:.colonToken(), expression:targetStruct4PackageAccessMA, trailingComma:nil)
	}
}

extension BoostSourceModule {
	var packageTargetLine:FunctionCallExprSyntax {
		let declRefExpr = DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("target"))
		let memberAccessExpr = MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:declRefExpr)
		let labeledList = LabeledExprListSyntax([
			self.targetNameLabel,
			self.targetDependenciesLabel,
			self.targetPathLabel,
			self.targetExcludesLabel,
			self.targetSourcesLabel,
			self.publicHeadersPathLabel,
			self.packageAccessLabel
		])
		return FunctionCallExprSyntax(calledExpression:memberAccessExpr, leftParen:TokenSyntax.leftParenToken(), arguments:labeledList, rightParen:TokenSyntax.rightParenToken(), trailingClosure:nil)
	}
}