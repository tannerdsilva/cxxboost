let packageBase = Package(
	platforms:[
		.macOS(.v13)
	],
	dependencies:[
		.package(url:"https://github.com/tannerdsilva/SwiftSlash.git", from:"3.4.0"),
		.package(url:"https://github.com/apple/swift-argument-parser.git", from:"1.0.0"),
		.package(url:"https://github.com/apple/swift-log.git", from:"1.0.0"),
		.package(url:"https://github.com/apple/swift-syntax.git", from:"509.0.0"),
	],
    targets:[
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
		.plugin(name:"_boost_master_buildtool", capability:.buildTool(), dependencies:["_boost_master_prep"]),
		.systemLibrary(name:"libopenmpi", path:"./libopenmpi", pkgConfig:"ompi", providers:[
			.brew(["open-mpi"]),
			.apt(["libopenmpi-dev"])
		])
    ],
    cxxLanguageStandard:.cxx14
)

