import ArgumentParser
import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax
import SwiftBasicFormat

// declarations of the swift syntax used to define the target values within a structure
extension BoostSourceModule {

	/// the name value of this target.
	var targetStructNameLabelValue:StringLiteralExprSyntax {
		StringLiteralExprSyntax(content:self.name.packageTargetName)
	}

	/// the dependencies value of this target. it is an array of package names.
	var targetStructDependenciesLabelValue:ArrayExprSyntax {
		ArrayExprSyntax(elements:ArrayElementListSyntax {
			for dependency in self.dependencies {
				ArrayElementSyntax(expression:StringLiteralExprSyntax(content:dependency.packageTargetName))
			}
		})
	}

	/// the path value of this target. it is the relative path to the target directory
	var targetStructPathLabelValue:StringLiteralExprSyntax {
		StringLiteralExprSyntax(content:"./Modules/\(self.name.packageTargetName)/")
	}
	
	/// the excludes value of this target. it is an array of path strings that are excluded from the target.
	var targetStructExcludesLabelValue:ArrayExprSyntax {
		let hiddenPathValue = StringLiteralExprSyntax(content:".cant-see-me")
		let singleItemArray = ArrayElementSyntax(expression:hiddenPathValue)
		let arrayList = ArrayElementListSyntax([singleItemArray])
		return ArrayExprSyntax(leftSquare:TokenSyntax.leftSquareToken(), elements:arrayList, rightSquare:TokenSyntax.rightSquareToken())
	}
	
	
	var targetStructSourcesLabelValue:ArrayExprSyntax {
		let targetSourcesLabelValue:ArrayExprSyntax
		if (self.hasSource == true) {
			// enable the source directory with a single value
			let onlySourceValue = StringLiteralExprSyntax(content:"src")
			let arrayElement = ArrayElementSyntax(expression:onlySourceValue)
			let singleItemList = ArrayElementListSyntax([arrayElement])
			targetSourcesLabelValue = ArrayExprSyntax(leftSquare:TokenSyntax.leftSquareToken(), elements:singleItemList, rightSquare:TokenSyntax.rightSquareToken())
		} else {
			// explicitly empty source directory
			let emptyArray = ArrayElementListSyntax([])
			targetSourcesLabelValue = ArrayExprSyntax(leftSquare:TokenSyntax.leftSquareToken(), elements:emptyArray, rightSquare:TokenSyntax.rightSquareToken())
		}
		return targetSourcesLabelValue
	}
	
	
	var targetStructPublicHeadersPathLabelValue:StringLiteralExprSyntax {
		StringLiteralExprSyntax(content:"include")
	}
	
	
	var targetStructPublicAccessLabelValue:BooleanLiteralExprSyntax {
		BooleanLiteralExprSyntax(booleanLiteral:false)
	}
}
// build the variable decl's for each syntax label used to define the target values
extension BoostSourceModule {
	var targetStructNameVarDecl:VariableDeclSyntax {
		VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.static))]), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:PatternBindingListSyntax([
			PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("name")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("String")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:self.targetStructNameLabelValue))
		]))
	}
	var targetStructDependenciesVarDecl:VariableDeclSyntax {
		VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.static))]), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:PatternBindingListSyntax([
			PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("dependencies")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("Array<Target.Dependency>")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:self.targetStructDependenciesLabelValue))
		]))
	}
	var targetStructPathVarDecl:VariableDeclSyntax {
		VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.static))]), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:PatternBindingListSyntax([
			PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("path")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("String")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:self.targetStructPathLabelValue))
		]))
	}
	var targetStructExcludesVarDecl:VariableDeclSyntax {
		VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.static))]), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:PatternBindingListSyntax([
			PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("exclude")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("Array<String>")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:self.targetStructExcludesLabelValue))
		]))
	}
	var targetStructSourcesVarDecl:VariableDeclSyntax {
		VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.static))]), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:PatternBindingListSyntax([
			PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("sources")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("Array<String>")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:self.targetStructSourcesLabelValue))
		]))
	}
	var targetStructStructHeadersPathVarDecl:VariableDeclSyntax {
		VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.static))]), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:PatternBindingListSyntax([
			PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("publicHeadersPath")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("String")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:self.targetStructPublicHeadersPathLabelValue))
		]))
	}
	var targetStructAccessVarDecl:VariableDeclSyntax {
		VariableDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.static))]), bindingSpecifier:TokenSyntax.keyword(.`let`), bindings:PatternBindingListSyntax([
			PatternBindingSyntax(pattern:IdentifierPatternSyntax(identifier:TokenSyntax.identifier("packageAccess")), typeAnnotation:TypeAnnotationSyntax(colon:TokenSyntax.colonToken(), type:TypeSyntax("Bool")), initializer:InitializerClauseSyntax(equal:TokenSyntax.equalToken(), value:self.targetStructPublicAccessLabelValue))
		]))
	}
}

// member access expressions for access in the package declaration
extension BoostSourceModule {
	var targetStruct4PackageNameMA:MemberAccessExprSyntax {
		MemberAccessExprSyntax(base:DeclReferenceExprSyntax(baseName: TokenSyntax.identifier(self.name.packageTargetName)) , period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("name")))
	}
	var targetStruct4PackageDependenciesMA:MemberAccessExprSyntax {
		MemberAccessExprSyntax(base:DeclReferenceExprSyntax(baseName: TokenSyntax.identifier(self.name.packageTargetName)) , period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("dependencies")))
	}
	var targetStruct4PackagePathMA:MemberAccessExprSyntax {
		MemberAccessExprSyntax(base:DeclReferenceExprSyntax(baseName: TokenSyntax.identifier(self.name.packageTargetName)) , period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("path")))
	}
	var targetStruct4PackageExcludesMA:MemberAccessExprSyntax {
		MemberAccessExprSyntax(base:DeclReferenceExprSyntax(baseName: TokenSyntax.identifier(self.name.packageTargetName)) , period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("exclude")))
	}
	var targetStruct4PackageSourcesMA:MemberAccessExprSyntax {
		MemberAccessExprSyntax(base:DeclReferenceExprSyntax(baseName: TokenSyntax.identifier(self.name.packageTargetName)) , period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("sources")))
	}
	var targetStruct4PackagePublicHeadersPathMA:MemberAccessExprSyntax {
		MemberAccessExprSyntax(base:DeclReferenceExprSyntax(baseName: TokenSyntax.identifier(self.name.packageTargetName)) , period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("publicHeadersPath")))
	}
	var targetStruct4PackageAccessMA:MemberAccessExprSyntax {
		MemberAccessExprSyntax(base:DeclReferenceExprSyntax(baseName: TokenSyntax.identifier(self.name.packageTargetName)) , period:TokenSyntax.periodToken(), declName:DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("packageAccess")))
	}
}

// build the target declaration structure
extension BoostSourceModule {
	var targetStructDecl:StructDeclSyntax {
		let memblock = MemberBlockSyntax(leftBrace:TokenSyntax.leftBraceToken(), members:MemberBlockItemListSyntax([
			MemberBlockItemSyntax(decl:self.targetStructNameVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructDependenciesVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructPathVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructExcludesVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructSourcesVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructStructHeadersPathVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructAccessVarDecl)
		]), rightBrace:TokenSyntax.rightBraceToken())
		let myStruct = StructDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.fileprivate))]), structKeyword:TokenSyntax.keyword(.`struct`), name:TokenSyntax.identifier(self.name.packageTargetName), memberBlock:memblock)
		return myStruct
	}
}

extension BoostSourceModule {
	var targetProductDecl:FunctionCallExprSyntax {
		// build the primary function call
		let libraryDeclReference = DeclReferenceExprSyntax(baseName:TokenSyntax.identifier("library"))
		let memberAccessExpression = MemberAccessExprSyntax(period:TokenSyntax.periodToken(), declName:libraryDeclReference)
		
		// create the arguments for the function call
		let labeledList:LabeledExprListSyntax
		// name argument
		let nameLabelExpr = LabeledExprSyntax(label:TokenSyntax.identifier("name"), colon:TokenSyntax.colonToken(), expression:targetStruct4PackageNameMA, trailingComma:TokenSyntax.commaToken())

		// targets argument. there will only ever be one element in this array so we can hard code it.
		let arrayElement = ArrayElementSyntax(expression:targetStruct4PackageNameMA)
		let arrayElementList = ArrayElementListSyntax([arrayElement])
		let arrayExpr = ArrayExprSyntax(leftSquare:TokenSyntax.leftSquareToken(), elements:arrayElementList, rightSquare:TokenSyntax.rightSquareToken())
		let targetsLabelExpr = LabeledExprSyntax(label:TokenSyntax.identifier("targets"), colon:TokenSyntax.colonToken(), expression:arrayExpr)
		
		labeledList = LabeledExprListSyntax([nameLabelExpr, targetsLabelExpr])

		let memblock = FunctionCallExprSyntax(calledExpression:memberAccessExpression, leftParen:TokenSyntax.leftParenToken(), arguments:labeledList, rightParen:TokenSyntax.rightParenToken())
		return memblock
	}
}