import Foundation
import PackagePlugin

@main
struct GenerateBoostTests:CommandPlugin {
	func performCommand(context:PackagePlugin.PluginContext, arguments:[String]) async throws {
		// create the sources directory if it does not exist
		let projBase = URL(fileURLWithPath:context.packageDirectory)
		d
		let sourcesBase = projBase.appendingPathComponent("Sources", isDirectory:true)
	}
}