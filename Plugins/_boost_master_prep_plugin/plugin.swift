import PackagePlugin
import Foundation

struct Error:Swift.Error {
	let description:String
}

@main
struct MyCommand:CommandPlugin {

    func performCommand(context:PluginContext, arguments:[String]) throws {
    	let firstArgument = arguments.first!
    
		let baseDir = context.package.directory
		
		// name the build tool that we are going to run
		let runTool = try context.tool(named:"_boost_master_prep")

		// run the build tool
		let process = Process()
		process.executableURL = URL(fileURLWithPath:runTool.path.string)
		process.arguments = ["prepare-boost-source", "\(baseDir)", firstArgument]

		// run the build tool
		try process.run()	
		process.waitUntilExit()
		guard process.terminationStatus == 0 else {
			throw Error(description:"failed to run _boost_master_prep")
		}
	}
}
