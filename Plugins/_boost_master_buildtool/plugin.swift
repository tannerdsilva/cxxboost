import PackagePlugin

@main
struct BoostMasterPrepPlugin:BuildToolPlugin {

	// called once per target
	func createBuildCommands(context:PackagePlugin.PluginContext, target:PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
		let baseDirectory = target.directory
		let boostDir = baseDirectory.appending("boost")

		let boostLibs = boostDir.appending("libs")
		let boostTools = boostDir.appending("tools")

		let boostdepExe = boostTools.appending("boostdep").appending("build").appending("boostdep")

		return [.buildCommand(displayName:"generating contents for \(baseDirectory)",
							  executable:try context.tool(named:"_boost_master_prep").path,
							  arguments:["build-boostdep", boostDir.string],
							  inputFiles:[boostDir],
							  outputFiles:[boostdepExe])]
	}
}
