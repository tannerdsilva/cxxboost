import Foundation
import Logging
import SwiftParser
import SwiftSyntax
import SwiftBasicFormat

class StructConfigurationLister:SyntaxRewriter {
	let fixedLogger:Logger
	var assignedTargets:Set<BoostSourceModule>

	init(log:Logger, assigning:Set<BoostSourceModule>) {
		self.fixedLogger = log
		self.assignedTargets = assigning
	}

	override func visit(_ node:CodeBlockItemListSyntax) -> CodeBlockItemListSyntax {
		guard node.parent?.as(SourceFileSyntax.self) != nil, node.parent!.parent == nil else {
			// we are not in the source file, so we can pass through
			return node
		}
		var importDecl:ImportDeclSyntax?
		var nonmoduleCode = CodeBlockItemListSyntax()
		var configCode = [BoostSourceModule:CodeBlockItemSyntax]()
		var existingTargets = Set<BoostSourceModule>()
		for curItem in node {
			if let curItem = curItem.as(CodeBlockItemSyntax.self) {
				if let structDecl = curItem.item.as(StructDeclSyntax.self) {
					// this is a struct declaration, so we need to be more struct about what we are checking now.
					guard structDecl.modifiers.contains(where: { $0.name.text == "fileprivate" }) == true else {
						// this is not a fileprivate struct, so we can pass it through
						nonmoduleCode.insert(curItem, at:nonmoduleCode.startIndex)
						continue
					}
					guard structDecl.name.text.hasPrefix(BoostSourceModule.packageTargetNamePrefix) == true else {
						// this is not a boost module target, so we can pass it through
						nonmoduleCode.insert(curItem, at:nonmoduleCode.startIndex)
						continue
					}

					// from this point forward, we wont rewrite the struct declaration if it does not pass
					guard let hasMatchingTargetModule = self.assignedTargets.first(where: { $0.name.packageTargetName == structDecl.name.text }) else {
						continue
					}
					let targetStructDecl = structDecl
					existingTargets.update(with:hasMatchingTargetModule)
					configCode[hasMatchingTargetModule] = CodeBlockItemSyntax(item:CodeBlockItemSyntax.Item(targetStructDecl))
				} else if let curItem = curItem.item.as(ImportDeclSyntax.self) {
					importDecl = curItem
				} else {
					nonmoduleCode.insert(curItem, at:nonmoduleCode.startIndex)
				}
			}
		}

		// compare the existing matches with the assigned, and add any missing targets
		let delta = Delta(start:existingTargets, end:self.assignedTargets)
		for curMissing in delta.exclusiveEnd {
			let targetStructDecl = curMissing.targetStructDecl
			let targetStructItem = CodeBlockItemSyntax(item:CodeBlockItemSyntax.Item(targetStructDecl))
			configCode[curMissing] = targetStructItem
		}

		var finalOutput = CodeBlockItemListSyntax()
		if let importDecl = importDecl {
			finalOutput.append(CodeBlockItemSyntax(item:CodeBlockItemSyntax.Item(importDecl)))
		}
		for curItem in configCode.sorted(by: { $0.key.name.packageTargetName < $1.key.name.packageTargetName }).map({ $0.value }) {
			finalOutput.append(curItem)
		}
		for otherCode in nonmoduleCode {
			finalOutput.append(otherCode)
		}

		// all assigned targets are now in the array. we may return.
		return finalOutput
	}

}


// writes the new product list based on the assigned targets
class ProductsListModifier:SyntaxRewriter {
	let logger:Logger
	let sortedTargets:[BoostSourceModule]

	// this is a real thing that happens in the swift compiler
	init(log:Logger, assigning:Set<BoostSourceModule>) {
		self.logger = log
		self.sortedTargets = assigning.sorted(by: { $0.name.packageTargetName < $1.name.packageTargetName })
	}

	// blindly write the new products list based on the assigned targets
	override func visit(_ node:ArrayElementListSyntax) -> ArrayElementListSyntax {
		self.logger.info("rewriting products list with \(sortedTargets.count) targets.")
		// write the new products individually
		var rebuildArrayElements = ArrayElementListSyntax()
		for (i, curTarget) in self.sortedTargets.enumerated().reversed() {
			let productLine = curTarget.targetProductDecl
			var arrElement = ArrayElementSyntax(expression:productLine)
			if i != 0 {
				arrElement.trailingComma = TokenSyntax.commaToken()
			}
			rebuildArrayElements.append(arrElement)
		}
		return rebuildArrayElements
	}
}

class TargetsListModifier:SyntaxRewriter {
	let logger:Logger
	let assignTargets:Set<BoostSourceModule>

	init(log:Logger, assigning:Set<BoostSourceModule>) {
		self.logger = log
		self.assignTargets = assigning
	}
	
	// blindly write the new targets list based on the assigned targets
	override func visit(_ node:ArrayElementListSyntax) -> ArrayElementListSyntax {
		var existingElements = Set<BoostSourceModule>()
		var rebuildArrayElements = ArrayElementListSyntax()
		for curElement in node {
			// first pass, validate the basic contents of the array element
			if	let asArrayElement = curElement.as(ArrayElementSyntax.self),
				let funcCall = asArrayElement.expression.as(FunctionCallExprSyntax.self),
				let maExpr = funcCall.calledExpression.as(MemberAccessExprSyntax.self) {
				let maDeclExpr = maExpr.declName
				guard maDeclExpr.baseName.text == "target" else {
					// there are going to be other types of targets in here that we want to transparently pass through
					rebuildArrayElements.append(asArrayElement)
					continue
				}
				// search for the target name
				var targetNam:String? = nil
				let targetNameSeeker = PackageDescriptionTargetItemNameScanner(log:logger, expectedTargetNamePrefix:BoostSourceModule.packageTargetNamePrefix) { (targetName) in
					targetNam = targetName
				}
				targetNameSeeker.walk(funcCall)
				guard let foundName = targetNam, let foundPackageModule = self.assignTargets.first(where: { $0.name.packageTargetName == foundName }) else {
					// the module does not exist in the assigned targets, so we will not pass it through
					continue
				}
				// regenerate the function call expression from scratch now that we have validated a name match
				existingElements.update(with:foundPackageModule)
				let targetLine = ArrayElementSyntax(expression:foundPackageModule.packageTargetLine, trailingComma:TokenSyntax.commaToken())
				rebuildArrayElements.append(targetLine)
			}
		}

		// compare the existing matches with the assigned, and add any missing targets
		let delta = Delta(start:existingElements, end:self.assignTargets)
		for (i, curMissing) in delta.exclusiveEnd.enumerated().reversed() {
			logger.info("adding missing target '\(curMissing.name.packageTargetName)'.")
			var targetLine = ArrayElementSyntax(expression:curMissing.packageTargetLine)
			if i != 0 {
				targetLine.trailingComma = TokenSyntax.commaToken()
			}
			
			rebuildArrayElements.append(targetLine)
		}

		// all assigned targets are now in the array. we may return.
		return rebuildArrayElements
	}
}

class PackageDescriptionLabeledVariableRewriter:SyntaxRewriter {
	let logger:Logger
	let labelModifiers:[String:SyntaxRewriter]

	init(log:Logger, labelName:[String:SyntaxRewriter]) {
		self.logger = log
		self.labelModifiers = labelName
		super.init(viewMode:.sourceAccurate)
	}

	override func visit(_ node:LabeledExprSyntax) -> LabeledExprSyntax {
		var logger = self.logger
		logger[metadataKey:"node_id"] = "\(node.description.hashValue)"
		logger[metadataKey:"node_type"] = "LebeledExprSyntax"
		logger.trace("visiting labeled expression...")
		guard let myLabel = node.label?.text, let labelModifier = self.labelModifiers[myLabel] else {
			logger.debug("skipping labeled expression because we are not configured to handle it.")
			return node
		}
		logger.info("found '\(myLabel)' label.")
		let myRewrittenLabel = labelModifier.visit(node)
		return LabeledExprSyntax(label:node.label!, colon:node.colon!, expression:myRewrittenLabel.expression, trailingComma:node.trailingComma)
	}
}

class PackageDescriptionRewriter:SyntaxRewriter {
	let whenFound:((LabeledExprListSyntax) -> LabeledExprListSyntax)
	let logger:Logger
	
	let assignTargets:Set<BoostSourceModule>
	let packageNameMap:[String:BoostSourceModule]
	private let stripper:TriviaWiper
	private let formatter:PackageDescriptionFormatter
	
	init(log:Logger, assigning:Set<BoostSourceModule>, _ whenFound:@escaping((LabeledExprListSyntax) -> LabeledExprListSyntax)) {
		self.whenFound = whenFound
		self.logger = log
		self.assignTargets = assigning
		self.stripper = TriviaWiper(log:log)
		self.packageNameMap = Dictionary(uniqueKeysWithValues:assigning.map({ ($0.name.packageTargetName, $0) }))
		self.formatter = PackageDescriptionFormatter(log:log)
		super.init(viewMode:.sourceAccurate)
	}

	override func visit(_ node:StructDeclSyntax) -> DeclSyntax {
		var logger = self.logger
		logger[metadataKey:"node_id"] = "\(node.description.hashValue)"
		logger[metadataKey:"node_type"] = "StructDeclSyntax"
		guard node.modifiers.count == 1, node.modifiers.first?.name.text == "fileprivate" else {
			logger.debug("skipping struct declaration because it is not a `fileprivate` struct.")
			return DeclSyntax(node)
		}
		let name = node.name.text
		guard name.hasPrefix(BoostSourceModule.packageTargetNamePrefix) else {
			logger.debug("skipping struct declaration because it is not a boost module target.")
			return DeclSyntax(node)
		}
		
		return DeclSyntax(node)
	}

	override func visit(_ nodee:VariableDeclSyntax) -> DeclSyntax {
		var modNode = nodee
		var modStack:[()->Void] = []
		var logger = self.logger
		logger[metadataKey:"node_id"] = "\(modNode.description.hashValue)"
		logger[metadataKey:"node_type"] = "VariableDeclSyntax"
		logger.trace("visiting function call expression...")
		modStack.insert({
			modNode = modNode.formatted(using:self.formatter).as(VariableDeclSyntax.self)!
		}, at:0)
		guard modNode.bindingSpecifier.text == "let" else {
			logger.debug("skipping variable declaration because it is not a `let` constant.")
			return DeclSyntax(modNode)
		}
		guard modNode.bindings.count == 1 else {
			logger.debug("skipping variable declaration because it has more than one binding.")
			return DeclSyntax(modNode)
		}
		guard var onlyBinding = modNode.bindings.first?.as(PatternBindingSyntax.self) else {
			logger.debug("skipping variable declaration because it has no bindings.")
			return DeclSyntax(modNode)
		}
		modStack.insert({
			logger.trace("replacing bindings for declaration...")
			modNode.bindings = PatternBindingListSyntax([onlyBinding])
		}, at:0)
		guard let patternPat = onlyBinding.pattern.as(IdentifierPatternSyntax.self), patternPat.identifier.text == "package" else {
			logger.debug("skipping variable declaration because it does not match the identifier pattern.")
			return DeclSyntax(modNode)
		}
		modStack.insert({
			logger.trace("replacing pattern for binding...")
			onlyBinding.pattern = PatternSyntax(patternPat)
		}, at:0)
		guard var initializerValue = onlyBinding.initializer?.value.as(FunctionCallExprSyntax.self) else {
			logger.debug("skipping variable declaration because it does not have a function call initializer.")
			return DeclSyntax(modNode)
		}
		modStack.insert({
			logger.trace("replacing initializer value for binding...")
			onlyBinding.initializer?.value = ExprSyntax(initializerValue) 
		}, at:0)
		guard let declRefExpr = initializerValue.calledExpression.as(DeclReferenceExprSyntax.self), declRefExpr.baseName.text == "Package" else {
			logger.debug("skipping variable declaration because it does not have a function call initializer.")
			return DeclSyntax(modNode)
		}
		logger.info("found package declaration.")
		let strippedBody = self.stripper.visit(initializerValue.arguments)
		let newArgs = whenFound(strippedBody)
		initializerValue.arguments = newArgs
		for curFunc in modStack {
			curFunc()
		}
		return DeclSyntax(modNode)
	}
}

func updatePackageDescription(log:Logger, packageBase:URL) throws {
	let packageDescriptionURL = packageBase.appendingPathComponent("Package.swift")
	let packageDescriptionSource = try String(contentsOf:packageDescriptionURL)
	var packageDescriptionSyntax = Parser.parse(source:packageDescriptionSource)

	let allModulesURL = packageBase.appendingPathComponent("Modules").appendingPathComponent("boost-modules.json")
	let allModulesContent = try Data(contentsOf:allModulesURL)
	let allModules = Set(try JSONDecoder().decode([String:[String:BoostSourceModule]].self, from:allModulesContent).first.map({ $0.value })!.values)

	let packageRewriter = PackageDescriptionRewriter(log:log, assigning:allModules) { [log = log] (args) -> LabeledExprListSyntax in
		// let genericListMod = GenericListModifier(log:log)
		let targetsListModifier = TargetsListModifier(log:log, assigning:allModules)
		let productsAssigner = ProductsListModifier(log:log, assigning:allModules)
		let pdVarLabelSeeker = PackageDescriptionLabeledVariableRewriter(log:log, labelName:["targets":targetsListModifier, "products":productsAssigner])
		let item = pdVarLabelSeeker.visit(args)
		return item
	}

	let structRewriter = StructConfigurationLister(log:log, assigning:allModules)

	let rw = packageRewriter.visit(packageDescriptionSyntax)
	let rewrittenPackageDescription = structRewriter.visit(rw)

	let formatter = PackageDescriptionFormatter(log:log)
	let formattedPackageDescription = rewrittenPackageDescription.formatted(using:formatter)
	print("\(formattedPackageDescription.description)")
}