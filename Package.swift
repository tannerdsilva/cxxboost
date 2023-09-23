// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "cxxboost",
    dependencies:[
    	.package(url:"https://github.com/apple/swift-syntax.git", from:"509.0.0")
    ],
    products: [
    ],
    targets: [
    	.plugin(name:"generate-boost-targets"
    		capability:.command(
    			intent:.custom(
    				verb:"generate-boost-tests",
    				description:"boost test harness generator"
    			),
    			permissions:[
    				.writeToPackageDirectory(reason:"we need to be able to read the package directory in order to generate and write the sources for testing.")
    			]
    		)
    	),
    ],
    cxxLanguageStandard:.cxx14
)
