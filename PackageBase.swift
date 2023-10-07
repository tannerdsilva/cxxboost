// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

protocol TargetModule {
	static var name:String { get }
	static var dependencies:[Target.Dependency] { get }
	static var hasSource:Bool { get }
	static var excludes:[String] { get }
}
struct cxxboost {
	struct config {
		static let name = "config"
		static let dependencies:[Target.Dependency] = []
		static let hasSource = false
		static let excludes:[String] = []
	}
}

let package = Package(
    name: "cxxboost",
	platforms:[
		.macOS(.v13),
	],
	products:[
		.library(name:"cxxboost", targets:["cxxboost"]),
	],
	dependencies:[
		.package(url:"https://github.com/tannerdsilva/SwiftSlash.git", from:"3.4.0"),
		.package(url:"https://github.com/apple/swift-argument-parser.git", from:"1.0.0"),
		.package(url:"https://github.com/apple/swift-log.git", from:"1.0.0"),
		.package(url:"https://github.com/apple/swift-syntax.git", from:"509.0.0"),
	],
    targets:[
		.target(name:"cxxboost", dependencies:[], plugins:[]),
		.executableTarget(name:"_boost_master_prep", dependencies:[
			.product(name:"SwiftSlash", package:"SwiftSlash"),
			.product(name:"ArgumentParser", package:"swift-argument-parser"),
			.product(name:"Logging", package:"swift-log"),
			.product(name:"SwiftSyntax", package:"swift-syntax"),
			.product(name:"SwiftSyntaxBuilder", package:"swift-syntax"),
			.product(name:"SwiftParser", package:"swift-syntax"),
		]),
		.plugin(name:"_boost_master_prep_plugin", capability:.command(
			intent:.custom(verb:"prepare", description:"prepare boost and all of its submodules from source for building."), permissions: [.allowNetworkConnections(scope:.all(), reason:"downloading boost source code"), .writeToPackageDirectory(reason:"needs to manage submodules in master repo")]
		), dependencies: ["_boost_master_prep"]),
		.plugin(name:"_boost_master_buildtool", capability:.buildTool(), dependencies:["_boost_master_prep"])
    ],
    cxxLanguageStandard:.cxx14
)

