import ArgumentParser
import SwiftSlash
import Foundation
import Logging
import SwiftParser
import SwiftSyntax
import SwiftBasicFormat

// declarations of the swift syntax used to define the target values within a structure
extension BoostSourceModule {
	var targetStructNameLabelValue:StringLiteralExprSyntax {
		StringLiteralExprSyntax(content:self.name.packageTargetName)
	}

	var targetStructDependenciesLabelValue:ArrayExprSyntax {
		ArrayExprSyntax(elements:ArrayElementListSyntax {
			for (i, dependency) in self.dependencies.enumerated().reversed() {
				switch i {
					case 0:
						ArrayElementSyntax(expression:StringLiteralExprSyntax(content:dependency.packageTargetName))
					default:
						ArrayElementSyntax(expression:StringLiteralExprSyntax(content:dependency.packageTargetName))
				}
			}
		})
	}
	var targetStructPathLabelValue:StringLiteralExprSyntax {
		StringLiteralExprSyntax(content:"./Modules/\(self.name.packageTargetName)/")
	}
	var targetStructExcludesLabelValue:ArrayExprSyntax {
		ArrayExprSyntax(elements:ArrayElementListSyntax([ArrayElementSyntax(expression:StringLiteralExprSyntax(content:".cant-see-me"))]))
	}
	var targetStructSourcesLabelValue:ArrayExprSyntax {
		let targetSourcesLabelValue:ArrayExprSyntax
		if (self.hasSource == true) {
			// enable the source directory
			targetSourcesLabelValue = ArrayExprSyntax(elements:[
				ArrayElementSyntax(expression:StringLiteralExprSyntax(content:"src"))
			])
		} else {
			// explicitly empty source directory
			targetSourcesLabelValue = ArrayExprSyntax(elements:ArrayElementListSyntax {})
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
		let formatter = BasicFormat(indentationWidth:Trivia.tab)
		let memblock = MemberBlockSyntax(leftBrace:TokenSyntax.leftBraceToken(), members:MemberBlockItemListSyntax([
			MemberBlockItemSyntax(decl:self.targetStructNameVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructDependenciesVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructPathVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructExcludesVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructSourcesVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructStructHeadersPathVarDecl),
			MemberBlockItemSyntax(decl:self.targetStructAccessVarDecl)
		]), rightBrace:TokenSyntax.rightBraceToken()).formatted(using:formatter).as(MemberBlockSyntax.self)!
		let myStruct = StructDeclSyntax(attributes:AttributeListSyntax(), modifiers:DeclModifierListSyntax([DeclModifierSyntax(name:TokenSyntax.keyword(.fileprivate))]), structKeyword:TokenSyntax.keyword(.`struct`), name:TokenSyntax.identifier(self.name.packageTargetName), memberBlock:memblock).formatted(using:formatter).as(StructDeclSyntax.self)!
		return myStruct
	}
}
