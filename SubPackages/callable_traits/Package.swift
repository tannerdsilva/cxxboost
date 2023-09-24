// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "cxxboost_callable_traits",
    products: [
		.library(name:"cxxboost_callable_traits", targets:["boost_lib_callable_traits"]),
    ],
	dependencies: [],
    targets: [
		.target(name:"boost_lib_callable_traits", path:"./callable_traits", sources:[], publicHeadersPath:"include", packageAccess:true),
		// .target(name:"__testbridge", dependencies:["boost_lib_callable_traits"], path:"./", exclude:["callable_traits/test/CMakeLists.txt", "callable_traits/test/Jamfile.v2"], sources:["src", "callable_traits/test"], publicHeadersPath:"include"),
		.target(name:"test_callable_traits", dependencies:["boost_lib_callable_traits"], path:"./", exclude:["CMakeLists.txt", "Jamfile.v2"], sources:["./callable_traits/test/add_member_const.cpp"], publicHeadersPath:"include"),

		.testTarget(name:"test_callable_traits_tests", dependencies:["test_callable_traits"]),
	],
    cxxLanguageStandard:.cxx14
)
