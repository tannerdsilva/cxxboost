// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

fileprivate struct iostreams {
	static let name: String = "iostreams"
	static let dependencies: Array<Target.Dependency> = ["range", "static_assert", "iterator", "detail", "smart_ptr", "preprocessor", "mpl", "assert", "utility", "type_traits", "regex", "core", "config", "numeric-conversion", "integer", "random", "function", "throw_exception"]
	static let path: String = "./Modules/iostreams/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	#if os(Linux)
	static let publicHeadersPath: String = "include"
	#else
	static let publicHeadersPath: String = "include"
	#endif
	static let packageAccess: Bool = false
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
			.product(name:"SwiftBasicFormat", package:"swift-syntax")
		]),
		.plugin(
			name:"_boost_master_prep_plugin",
			capability:.command(
				intent:.custom(
					verb:"boost-checkout", 
					description:"prepare boost and all of its submodules from source for building."
				),
				permissions:[
					.allowNetworkConnections(
						scope:.all(), 
						reason:"downloading boost source code"
					),
					.writeToPackageDirectory(
						reason:"needs to manage submodules in master repo"
					)
				]
			),
			dependencies: ["_boost_master_prep"]
		),
		.plugin(name:"_boost_master_package_render", capability:.command(
			intent:.custom(verb:"package-render", description:"render the target information into the package description"), permissions: [.writeToPackageDirectory(
					reason:"needs to manage submodules in master repo"
				)]
		), dependencies: ["_boost_master_prep"]),
		.plugin(name:"_boost_master_buildtool", capability:.buildTool(), dependencies:["_boost_master_prep"]),
		.systemLibrary(name:"libopenmpi", path:"./libopenmpi", pkgConfig:"ompi", providers:[
			.brew(["open-mpi"]),
			.apt(["libopenmpi-dev"])
		])
	],
	cxxLanguageStandard:.cxx14
)

