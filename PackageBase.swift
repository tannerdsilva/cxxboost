// swift-tools-version: 5.9
import PackageDescription

fileprivate struct cxxboost_accumulators {
	static let name: String = "cxxboost_accumulators"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_preprocessor",
		"cxxboost_iterator",
		"cxxboost_parameter",
		"cxxboost_circular_buffer",
		"cxxboost_tuple",
		"cxxboost_core",
		"cxxboost_numeric-ublas",
		"cxxboost_type_traits",
		"cxxboost_assert",
		"cxxboost_range",
		"cxxboost_throw_exception",
		"cxxboost_mpl",
		"cxxboost_serialization",
		"cxxboost_fusion",
		"cxxboost_static_assert",
		"cxxboost_config",
		"cxxboost_typeof",
		"cxxboost_numeric-conversion",
		"cxxboost_concept_check",
		"cxxboost_array"
	]
	static let path: String = "./Modules/cxxboost_accumulators/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_algorithm {
	static let name: String = "cxxboost_algorithm"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_exception",
		"cxxboost_tuple",
		"cxxboost_concept_check",
		"cxxboost_type_traits",
		"cxxboost_regex",
		"cxxboost_range",
		"cxxboost_bind",
		"cxxboost_array",
		"cxxboost_iterator",
		"cxxboost_unordered",
		"cxxboost_assert",
		"cxxboost_static_assert",
		"cxxboost_function",
		"cxxboost_config",
		"cxxboost_core",
		"cxxboost_mpl",
		"cxxboost_throw_exception"
	]
	static let path: String = "./Modules/cxxboost_algorithm/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_align {
	static let name: String = "cxxboost_align"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_align/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_any {
	static let name: String = "cxxboost_any"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_index",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_static_assert",
		"cxxboost_assert",
		"cxxboost_throw_exception"
	]
	static let path: String = "./Modules/cxxboost_any/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_array {
	static let name: String = "cxxboost_array"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_config",
		"cxxboost_throw_exception",
		"cxxboost_static_assert",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_array/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_asio {
	static let name: String = "cxxboost_asio"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_coroutine",
		"cxxboost_system",
		"cxxboost_chrono",
		"cxxboost_regex",
		"cxxboost_config",
		"cxxboost_throw_exception",
		"cxxboost_context",
		"cxxboost_bind",
		"cxxboost_function",
		"cxxboost_type_traits",
		"cxxboost_assert",
		"cxxboost_core",
		"cxxboost_utility",
		"cxxboost_align",
		"cxxboost_exception",
		"cxxboost_date_time",
		"cxxboost_array",
		"cxxboost_smart_ptr"
	]
	static let path: String = "./Modules/cxxboost_asio/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_assert {
	static let name: String = "cxxboost_assert"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_config"]
	static let path: String = "./Modules/cxxboost_assert/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_assign {
	static let name: String = "cxxboost_assign"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_move",
		"cxxboost_range",
		"cxxboost_throw_exception",
		"cxxboost_config",
		"cxxboost_preprocessor",
		"cxxboost_static_assert",
		"cxxboost_core",
		"cxxboost_array",
		"cxxboost_ptr_container",
		"cxxboost_type_traits",
		"cxxboost_tuple"
	]
	static let path: String = "./Modules/cxxboost_assign/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_atomic {
	static let name: String = "cxxboost_atomic"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_winapi",
		"cxxboost_align",
		"cxxboost_preprocessor",
		"cxxboost_predef",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_atomic/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_beast {
	static let name: String = "cxxboost_beast"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_winapi",
		"cxxboost_preprocessor",
		"cxxboost_assert",
		"cxxboost_throw_exception",
		"cxxboost_core",
		"cxxboost_static_string",
		"cxxboost_container",
		"cxxboost_static_assert",
		"cxxboost_asio",
		"cxxboost_config",
		"cxxboost_container_hash",
		"cxxboost_smart_ptr",
		"cxxboost_logic",
		"cxxboost_intrusive",
		"cxxboost_optional",
		"cxxboost_bind",
		"cxxboost_type_index",
		"cxxboost_system",
		"cxxboost_endian",
		"cxxboost_mp11"
	]
	static let path: String = "./Modules/cxxboost_beast/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_bimap {
	static let name: String = "cxxboost_bimap"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_preprocessor",
		"cxxboost_core",
		"cxxboost_multi_index",
		"cxxboost_concept_check",
		"cxxboost_lambda",
		"cxxboost_mpl",
		"cxxboost_container_hash",
		"cxxboost_throw_exception",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_utility",
		"cxxboost_iterator"
	]
	static let path: String = "./Modules/cxxboost_bimap/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_bind {
	static let name: String = "cxxboost_bind"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_config", "cxxboost_core"]
	static let path: String = "./Modules/cxxboost_bind/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_callable_traits {
	static let name: String = "cxxboost_callable_traits"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_callable_traits/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_chrono {
	static let name: String = "cxxboost_chrono"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_utility",
		"cxxboost_typeof",
		"cxxboost_system",
		"cxxboost_type_traits",
		"cxxboost_ratio",
		"cxxboost_assert",
		"cxxboost_core",
		"cxxboost_throw_exception",
		"cxxboost_integer",
		"cxxboost_predef",
		"cxxboost_static_assert",
		"cxxboost_mpl",
		"cxxboost_move",
		"cxxboost_config",
		"cxxboost_winapi"
	]
	static let path: String = "./Modules/cxxboost_chrono/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_circular_buffer {
	static let name: String = "cxxboost_circular_buffer"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_throw_exception",
		"cxxboost_concept_check",
		"cxxboost_type_traits",
		"cxxboost_static_assert",
		"cxxboost_assert",
		"cxxboost_move"
	]
	static let path: String = "./Modules/cxxboost_circular_buffer/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_compatibility {
	static let name: String = "cxxboost_compatibility"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_compatibility/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_compute {
	static let name: String = "cxxboost_compute"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_function_types",
		"cxxboost_thread",
		"cxxboost_proto",
		"cxxboost_core",
		"cxxboost_lexical_cast",
		"cxxboost_range",
		"cxxboost_assert",
		"cxxboost_optional",
		"cxxboost_mpl",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_uuid",
		"cxxboost_chrono",
		"cxxboost_static_assert",
		"cxxboost_tuple",
		"cxxboost_utility",
		"cxxboost_smart_ptr",
		"cxxboost_throw_exception",
		"cxxboost_preprocessor",
		"cxxboost_filesystem",
		"cxxboost_fusion",
		"cxxboost_algorithm",
		"cxxboost_iterator",
		"cxxboost_function",
		"cxxboost_typeof",
		"cxxboost_array",
		"cxxboost_property_tree"
	]
	static let path: String = "./Modules/cxxboost_compute/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_concept_check {
	static let name: String = "cxxboost_concept_check"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_static_assert",
		"cxxboost_preprocessor",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_concept_check/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_config {
	static let name: String = "cxxboost_config"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_config/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_container {
	static let name: String = "cxxboost_container"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_intrusive",
		"cxxboost_config",
		"cxxboost_static_assert",
		"cxxboost_assert",
		"cxxboost_move"
	]
	static let path: String = "./Modules/cxxboost_container/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_container_hash {
	static let name: String = "cxxboost_container_hash"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_mp11",
		"cxxboost_describe",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_container_hash/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_context {
	static let name: String = "cxxboost_context"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_predef",
		"cxxboost_assert",
		"cxxboost_pool",
		"cxxboost_smart_ptr",
		"cxxboost_config",
		"cxxboost_core",
		"cxxboost_mp11"
	]
	static let path: String = "./Modules/cxxboost_context/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_contract {
	static let name: String = "cxxboost_contract"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_core",
		"cxxboost_type_traits",
		"cxxboost_assert",
		"cxxboost_thread",
		"cxxboost_smart_ptr",
		"cxxboost_typeof",
		"cxxboost_function_types",
		"cxxboost_config",
		"cxxboost_mpl",
		"cxxboost_exception",
		"cxxboost_any",
		"cxxboost_preprocessor",
		"cxxboost_utility",
		"cxxboost_optional",
		"cxxboost_function"
	]
	static let path: String = "./Modules/cxxboost_contract/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_conversion {
	static let name: String = "cxxboost_conversion"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_typeof",
		"cxxboost_config",
		"cxxboost_smart_ptr",
		"cxxboost_throw_exception",
		"cxxboost_core",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_conversion/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_convert {
	static let name: String = "cxxboost_convert"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_function_types",
		"cxxboost_range",
		"cxxboost_mpl",
		"cxxboost_type_traits",
		"cxxboost_parameter",
		"cxxboost_config",
		"cxxboost_core",
		"cxxboost_math",
		"cxxboost_spirit",
		"cxxboost_optional",
		"cxxboost_lexical_cast"
	]
	static let path: String = "./Modules/cxxboost_convert/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_core {
	static let name: String = "cxxboost_core"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_throw_exception",
		"cxxboost_config",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_core/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_coroutine {
	static let name: String = "cxxboost_coroutine"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_move",
		"cxxboost_context",
		"cxxboost_utility",
		"cxxboost_throw_exception",
		"cxxboost_system",
		"cxxboost_assert",
		"cxxboost_core",
		"cxxboost_exception",
		"cxxboost_config",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_coroutine/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_coroutine2 {
	static let name: String = "cxxboost_coroutine2"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_context",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_coroutine2/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_crc {
	static let name: String = "cxxboost_crc"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_array",
		"cxxboost_integer",
		"cxxboost_config",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_crc/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_date_time {
	static let name: String = "cxxboost_date_time"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_type_traits",
		"cxxboost_range",
		"cxxboost_static_assert",
		"cxxboost_utility",
		"cxxboost_tokenizer",
		"cxxboost_core",
		"cxxboost_lexical_cast",
		"cxxboost_io",
		"cxxboost_winapi",
		"cxxboost_throw_exception",
		"cxxboost_algorithm",
		"cxxboost_smart_ptr",
		"cxxboost_config",
		"cxxboost_numeric-conversion"
	]
	static let path: String = "./Modules/cxxboost_date_time/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_describe {
	static let name: String = "cxxboost_describe"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_mp11"]
	static let path: String = "./Modules/cxxboost_describe/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_detail {
	static let name: String = "cxxboost_detail"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_preprocessor",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_detail/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_dll {
	static let name: String = "cxxboost_dll"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_type_index",
		"cxxboost_config",
		"cxxboost_function",
		"cxxboost_assert",
		"cxxboost_spirit",
		"cxxboost_system",
		"cxxboost_winapi",
		"cxxboost_filesystem",
		"cxxboost_static_assert",
		"cxxboost_predef",
		"cxxboost_smart_ptr",
		"cxxboost_core",
		"cxxboost_move",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_dll/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_dynamic_bitset {
	static let name: String = "cxxboost_dynamic_bitset"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_throw_exception",
		"cxxboost_assert",
		"cxxboost_static_assert",
		"cxxboost_config",
		"cxxboost_integer",
		"cxxboost_move",
		"cxxboost_container_hash"
	]
	static let path: String = "./Modules/cxxboost_dynamic_bitset/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_endian {
	static let name: String = "cxxboost_endian"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_endian/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_exception {
	static let name: String = "cxxboost_exception"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_tuple",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_throw_exception",
		"cxxboost_smart_ptr",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_exception/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_fiber {
	static let name: String = "cxxboost_fiber"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_context",
		"cxxboost_format",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_intrusive",
		"cxxboost_filesystem",
		"cxxboost_smart_ptr",
		"cxxboost_assert",
		"cxxboost_algorithm",
		"cxxboost_predef"
	]
	static let path: String = "./Modules/cxxboost_fiber/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_filesystem {
	static let name: String = "cxxboost_filesystem"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_system",
		"cxxboost_throw_exception",
		"cxxboost_core",
		"cxxboost_assert",
		"cxxboost_detail",
		"cxxboost_iterator",
		"cxxboost_io",
		"cxxboost_winapi",
		"cxxboost_smart_ptr",
		"cxxboost_atomic",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_container_hash",
		"cxxboost_predef"
	]
	static let path: String = "./Modules/cxxboost_filesystem/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_flyweight {
	static let name: String = "cxxboost_flyweight"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_parameter",
		"cxxboost_assert",
		"cxxboost_container_hash",
		"cxxboost_multi_index",
		"cxxboost_mpl",
		"cxxboost_throw_exception",
		"cxxboost_detail",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_smart_ptr",
		"cxxboost_interprocess",
		"cxxboost_config",
		"cxxboost_preprocessor"
	]
	static let path: String = "./Modules/cxxboost_flyweight/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_foreach {
	static let name: String = "cxxboost_foreach"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_range",
		"cxxboost_config",
		"cxxboost_iterator",
		"cxxboost_mpl",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_foreach/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_format {
	static let name: String = "cxxboost_format"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_throw_exception",
		"cxxboost_assert",
		"cxxboost_utility",
		"cxxboost_core",
		"cxxboost_optional",
		"cxxboost_smart_ptr"
	]
	static let path: String = "./Modules/cxxboost_format/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_function {
	static let name: String = "cxxboost_function"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_preprocessor",
		"cxxboost_throw_exception",
		"cxxboost_typeof",
		"cxxboost_assert",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_bind"
	]
	static let path: String = "./Modules/cxxboost_function/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_function_types {
	static let name: String = "cxxboost_function_types"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_preprocessor",
		"cxxboost_core",
		"cxxboost_mpl",
		"cxxboost_detail",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_function_types/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_functional {
	static let name: String = "cxxboost_functional"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_mpl",
		"cxxboost_function_types",
		"cxxboost_config",
		"cxxboost_typeof",
		"cxxboost_core",
		"cxxboost_preprocessor",
		"cxxboost_type_traits",
		"cxxboost_utility",
		"cxxboost_function"
	]
	static let path: String = "./Modules/cxxboost_functional/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_fusion {
	static let name: String = "cxxboost_fusion"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_function_types",
		"cxxboost_config",
		"cxxboost_functional",
		"cxxboost_typeof",
		"cxxboost_container_hash",
		"cxxboost_mpl",
		"cxxboost_static_assert",
		"cxxboost_core",
		"cxxboost_utility",
		"cxxboost_tuple",
		"cxxboost_preprocessor"
	]
	static let path: String = "./Modules/cxxboost_fusion/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_geometry {
	static let name: String = "cxxboost_geometry"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_integer",
		"cxxboost_fusion",
		"cxxboost_thread",
		"cxxboost_config",
		"cxxboost_algorithm",
		"cxxboost_assert",
		"cxxboost_math",
		"cxxboost_smart_ptr",
		"cxxboost_concept_check",
		"cxxboost_tuple",
		"cxxboost_throw_exception",
		"cxxboost_static_assert",
		"cxxboost_mpl",
		"cxxboost_variant2",
		"cxxboost_function_types",
		"cxxboost_container",
		"cxxboost_type_traits",
		"cxxboost_polygon",
		"cxxboost_core",
		"cxxboost_array",
		"cxxboost_range",
		"cxxboost_serialization",
		"cxxboost_lexical_cast",
		"cxxboost_rational",
		"cxxboost_any",
		"cxxboost_tokenizer",
		"cxxboost_qvm",
		"cxxboost_utility",
		"cxxboost_iterator",
		"cxxboost_variant",
		"cxxboost_move",
		"cxxboost_numeric-conversion",
		"cxxboost_multiprecision"
	]
	static let path: String = "./Modules/cxxboost_geometry/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_gil {
	static let name: String = "cxxboost_gil"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_integer",
		"cxxboost_filesystem",
		"cxxboost_preprocessor",
		"cxxboost_variant2",
		"cxxboost_iterator",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_mp11",
		"cxxboost_config",
		"cxxboost_concept_check",
		"cxxboost_assert",
		"cxxboost_container_hash"
	]
	static let path: String = "./Modules/cxxboost_gil/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_graph {
	static let name: String = "cxxboost_graph"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_any",
		"cxxboost_regex",
		"cxxboost_preprocessor",
		"cxxboost_config",
		"cxxboost_tti",
		"cxxboost_unordered",
		"cxxboost_property_map",
		"cxxboost_typeof",
		"cxxboost_bimap",
		"cxxboost_integer",
		"cxxboost_parameter",
		"cxxboost_detail",
		"cxxboost_spirit",
		"cxxboost_random",
		"cxxboost_throw_exception",
		"cxxboost_math",
		"cxxboost_mpl",
		"cxxboost_serialization",
		"cxxboost_static_assert",
		"cxxboost_move",
		"cxxboost_conversion",
		"cxxboost_tuple",
		"cxxboost_optional",
		"cxxboost_foreach",
		"cxxboost_property_tree",
		"cxxboost_assert",
		"cxxboost_smart_ptr",
		"cxxboost_iterator",
		"cxxboost_concept_check",
		"cxxboost_utility",
		"cxxboost_type_traits",
		"cxxboost_algorithm",
		"cxxboost_xpressive",
		"cxxboost_array",
		"cxxboost_multi_index",
		"cxxboost_bind",
		"cxxboost_core",
		"cxxboost_function",
		"cxxboost_range",
		"cxxboost_container_hash",
		"cxxboost_lexical_cast"
	]
	static let path: String = "./Modules/cxxboost_graph/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_graph_parallel {
	static let name: String = "cxxboost_graph_parallel"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_filesystem",
		"cxxboost_property_map_parallel",
		"cxxboost_mpi",
		"cxxboost_container_hash",
		"cxxboost_mpl",
		"cxxboost_static_assert",
		"cxxboost_config",
		"cxxboost_variant",
		"cxxboost_core",
		"cxxboost_detail",
		"cxxboost_concept_check",
		"cxxboost_function",
		"cxxboost_graph",
		"cxxboost_property_map",
		"cxxboost_smart_ptr",
		"cxxboost_random",
		"cxxboost_algorithm",
		"cxxboost_lexical_cast",
		"cxxboost_foreach",
		"cxxboost_dynamic_bitset",
		"cxxboost_optional",
		"cxxboost_type_traits",
		"cxxboost_serialization",
		"cxxboost_iterator",
		"cxxboost_tuple",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_graph_parallel/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_hana {
	static let name: String = "cxxboost_hana"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_mpl",
		"cxxboost_config",
		"cxxboost_tuple",
		"cxxboost_core",
		"cxxboost_fusion"
	]
	static let path: String = "./Modules/cxxboost_hana/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_headers {
	static let name: String = "cxxboost_headers"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_headers/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_heap {
	static let name: String = "cxxboost_heap"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_intrusive",
		"cxxboost_concept_check",
		"cxxboost_throw_exception",
		"cxxboost_array",
		"cxxboost_static_assert",
		"cxxboost_type_traits",
		"cxxboost_iterator",
		"cxxboost_parameter",
		"cxxboost_assert",
		"cxxboost_config",
		"cxxboost_bind"
	]
	static let path: String = "./Modules/cxxboost_heap/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_histogram {
	static let name: String = "cxxboost_histogram"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_math",
		"cxxboost_config",
		"cxxboost_serialization",
		"cxxboost_mp11",
		"cxxboost_variant2",
		"cxxboost_throw_exception",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_histogram/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_hof {
	static let name: String = "cxxboost_hof"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_hof/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_icl {
	static let name: String = "cxxboost_icl"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_mpl",
		"cxxboost_assert",
		"cxxboost_container",
		"cxxboost_static_assert",
		"cxxboost_date_time",
		"cxxboost_move",
		"cxxboost_iterator",
		"cxxboost_concept_check",
		"cxxboost_core",
		"cxxboost_rational",
		"cxxboost_range",
		"cxxboost_detail",
		"cxxboost_utility"
	]
	static let path: String = "./Modules/cxxboost_icl/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_integer {
	static let name: String = "cxxboost_integer"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_throw_exception",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_assert",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_integer/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_interprocess {
	static let name: String = "cxxboost_interprocess"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_intrusive",
		"cxxboost_container",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_unordered",
		"cxxboost_move",
		"cxxboost_winapi",
		"cxxboost_assert",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_interprocess/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_intrusive {
	static let name: String = "cxxboost_intrusive"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_container_hash",
		"cxxboost_move",
		"cxxboost_static_assert",
		"cxxboost_config",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_intrusive/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_io {
	static let name: String = "cxxboost_io"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_config"]
	static let path: String = "./Modules/cxxboost_io/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}

fileprivate struct cxxboost_iostreams {
	static let name: String = "iostreams"
	static let dependencies: Array<Target.Dependency> = [
		"range",
		"static_assert",
		"iterator",
		"detail",
		"smart_ptr",
		"preprocessor",
		"mpl",
		"assert",
		"utility",
		"type_traits",
		"regex",
		"core",
		"config",
		"numeric-conversion",
		"integer",
		"random",
		"function",
		"throw_exception"
	]
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
fileprivate struct cxxboost_iterator {
	static let name: String = "cxxboost_iterator"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_conversion",
		"cxxboost_function_types",
		"cxxboost_type_traits",
		"cxxboost_smart_ptr",
		"cxxboost_utility",
		"cxxboost_static_assert",
		"cxxboost_mpl",
		"cxxboost_fusion",
		"cxxboost_assert",
		"cxxboost_detail",
		"cxxboost_concept_check",
		"cxxboost_optional",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_iterator/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_json {
	static let name: String = "cxxboost_json"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_mp11",
		"cxxboost_assert",
		"cxxboost_throw_exception",
		"cxxboost_align",
		"cxxboost_system",
		"cxxboost_container_hash",
		"cxxboost_describe",
		"cxxboost_config",
		"cxxboost_container"
	]
	static let path: String = "./Modules/cxxboost_json/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_lambda {
	static let name: String = "cxxboost_lambda"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_iterator",
		"cxxboost_bind",
		"cxxboost_config",
		"cxxboost_detail",
		"cxxboost_utility",
		"cxxboost_preprocessor",
		"cxxboost_mpl",
		"cxxboost_core",
		"cxxboost_tuple",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_lambda/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_lambda2 {
	static let name: String = "cxxboost_lambda2"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_lambda2/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_leaf {
	static let name: String = "cxxboost_leaf"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_leaf/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_lexical_cast {
	static let name: String = "cxxboost_lexical_cast"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_container",
		"cxxboost_range",
		"cxxboost_integer",
		"cxxboost_numeric-conversion",
		"cxxboost_throw_exception",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_array",
		"cxxboost_config",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_lexical_cast/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_local_function {
	static let name: String = "cxxboost_local_function"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_scope_exit",
		"cxxboost_type_traits",
		"cxxboost_mpl",
		"cxxboost_typeof",
		"cxxboost_preprocessor",
		"cxxboost_utility"
	]
	static let path: String = "./Modules/cxxboost_local_function/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_locale {
	static let name: String = "cxxboost_locale"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_iterator",
		"cxxboost_thread",
		"cxxboost_config",
		"cxxboost_assert",
		"cxxboost_predef"
	]
	static let path: String = "./Modules/cxxboost_locale/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_lockfree {
	static let name: String = "cxxboost_lockfree"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_array",
		"cxxboost_atomic",
		"cxxboost_parameter",
		"cxxboost_type_traits",
		"cxxboost_mpl",
		"cxxboost_integer",
		"cxxboost_assert",
		"cxxboost_align",
		"cxxboost_tuple",
		"cxxboost_static_assert",
		"cxxboost_utility",
		"cxxboost_iterator",
		"cxxboost_core",
		"cxxboost_predef",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_lockfree/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_log {
	static let name: String = "cxxboost_log"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_io",
		"cxxboost_parameter",
		"cxxboost_container",
		"cxxboost_mpl",
		"cxxboost_config",
		"cxxboost_preprocessor",
		"cxxboost_align",
		"cxxboost_lexical_cast",
		"cxxboost_type_traits",
		"cxxboost_winapi",
		"cxxboost_move",
		"cxxboost_smart_ptr",
		"cxxboost_property_tree",
		"cxxboost_bind",
		"cxxboost_range",
		"cxxboost_interprocess",
		"cxxboost_array",
		"cxxboost_phoenix",
		"cxxboost_assert",
		"cxxboost_proto",
		"cxxboost_xpressive",
		"cxxboost_predef",
		"cxxboost_throw_exception",
		"cxxboost_fusion",
		"cxxboost_atomic",
		"cxxboost_exception",
		"cxxboost_core",
		"cxxboost_random",
		"cxxboost_system",
		"cxxboost_intrusive",
		"cxxboost_static_assert",
		"cxxboost_date_time",
		"cxxboost_optional",
		"cxxboost_filesystem",
		"cxxboost_spirit",
		"cxxboost_function_types",
		"cxxboost_iterator",
		"cxxboost_utility",
		"cxxboost_type_index",
		"cxxboost_asio",
		"cxxboost_thread",
		"cxxboost_regex"
	]
	static let path: String = "./Modules/cxxboost_log/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_logic {
	static let name: String = "cxxboost_logic"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_core", "cxxboost_config"]
	static let path: String = "./Modules/cxxboost_logic/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_math {
	static let name: String = "cxxboost_math"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_lexical_cast",
		"cxxboost_config",
		"cxxboost_static_assert",
		"cxxboost_throw_exception",
		"cxxboost_core",
		"cxxboost_concept_check",
		"cxxboost_random",
		"cxxboost_integer",
		"cxxboost_predef"
	]
	static let path: String = "./Modules/cxxboost_math/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_metaparse {
	static let name: String = "cxxboost_metaparse"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_preprocessor",
		"cxxboost_mpl",
		"cxxboost_predef",
		"cxxboost_config",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_metaparse/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_move {
	static let name: String = "cxxboost_move"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_config"]
	static let path: String = "./Modules/cxxboost_move/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_mp11 {
	static let name: String = "cxxboost_mp11"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_mp11/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_mpi {
	static let name: String = "cxxboost_mpi"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_function",
		"cxxboost_smart_ptr",
		"cxxboost_graph",
		"cxxboost_assert",
		"cxxboost_lexical_cast",
		"cxxboost_optional",
		"cxxboost_python",
		"cxxboost_integer",
		"cxxboost_mpl",
		"cxxboost_config",
		"cxxboost_serialization",
		"cxxboost_throw_exception",
		"cxxboost_static_assert",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_utility",
		"cxxboost_foreach",
		"cxxboost_iterator"
	]
	static let path: String = "./Modules/cxxboost_mpi/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_mpl {
	static let name: String = "cxxboost_mpl"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_preprocessor",
		"cxxboost_utility",
		"cxxboost_predef",
		"cxxboost_core",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_mpl/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_msm {
	static let name: String = "cxxboost_msm"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_fusion",
		"cxxboost_function",
		"cxxboost_proto",
		"cxxboost_circular_buffer",
		"cxxboost_typeof",
		"cxxboost_bind",
		"cxxboost_serialization",
		"cxxboost_any",
		"cxxboost_assert",
		"cxxboost_core",
		"cxxboost_mpl",
		"cxxboost_preprocessor",
		"cxxboost_parameter",
		"cxxboost_tuple",
		"cxxboost_phoenix",
		"cxxboost_type_traits",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_msm/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_multi_array {
	static let name: String = "cxxboost_multi_array"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_concept_check",
		"cxxboost_static_assert",
		"cxxboost_iterator",
		"cxxboost_core",
		"cxxboost_functional",
		"cxxboost_array",
		"cxxboost_mpl"
	]
	static let path: String = "./Modules/cxxboost_multi_array/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_multi_index {
	static let name: String = "cxxboost_multi_index"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_mpl",
		"cxxboost_smart_ptr",
		"cxxboost_type_traits",
		"cxxboost_container_hash",
		"cxxboost_move",
		"cxxboost_assert",
		"cxxboost_preprocessor",
		"cxxboost_tuple",
		"cxxboost_utility",
		"cxxboost_config",
		"cxxboost_iterator",
		"cxxboost_throw_exception",
		"cxxboost_bind",
		"cxxboost_core",
		"cxxboost_static_assert",
		"cxxboost_integer"
	]
	static let path: String = "./Modules/cxxboost_multi_index/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_multiprecision {
	static let name: String = "cxxboost_multiprecision"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_math",
		"cxxboost_assert",
		"cxxboost_core",
		"cxxboost_random",
		"cxxboost_throw_exception",
		"cxxboost_integer",
		"cxxboost_lexical_cast",
		"cxxboost_predef"
	]
	static let path: String = "./Modules/cxxboost_multiprecision/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_mysql {
	static let name: String = "cxxboost_mysql"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_asio",
		"cxxboost_lexical_cast",
		"cxxboost_throw_exception",
		"cxxboost_mp11",
		"cxxboost_core",
		"cxxboost_assert",
		"cxxboost_config",
		"cxxboost_endian",
		"cxxboost_system",
		"cxxboost_variant2"
	]
	static let path: String = "./Modules/cxxboost_mysql/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_nowide {
	static let name: String = "cxxboost_nowide"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_filesystem", "cxxboost_config"]
	static let path: String = "./Modules/cxxboost_nowide/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_numeric-conversion {
	static let name: String = "cxxboost_numeric-conversion"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_preprocessor",
		"cxxboost_throw_exception",
		"cxxboost_mpl",
		"cxxboost_conversion",
		"cxxboost_config",
		"cxxboost_core",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_numeric-conversion/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_numeric-interval {
	static let name: String = "cxxboost_numeric-interval"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_detail",
		"cxxboost_logic",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_numeric-interval/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_numeric-odeint {
	static let name: String = "cxxboost_numeric-odeint"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_mpi",
		"cxxboost_range",
		"cxxboost_core",
		"cxxboost_bind",
		"cxxboost_config",
		"cxxboost_array",
		"cxxboost_function",
		"cxxboost_assert",
		"cxxboost_utility",
		"cxxboost_throw_exception",
		"cxxboost_preprocessor",
		"cxxboost_units",
		"cxxboost_compute",
		"cxxboost_math",
		"cxxboost_type_traits",
		"cxxboost_fusion",
		"cxxboost_static_assert",
		"cxxboost_iterator",
		"cxxboost_multi_array",
		"cxxboost_mpl",
		"cxxboost_numeric-ublas"
	]
	static let path: String = "./Modules/cxxboost_numeric-odeint/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_numeric-ublas {
	static let name: String = "cxxboost_numeric-ublas"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_range",
		"cxxboost_typeof",
		"cxxboost_compute",
		"cxxboost_core",
		"cxxboost_numeric-interval",
		"cxxboost_type_traits",
		"cxxboost_serialization",
		"cxxboost_config",
		"cxxboost_iterator",
		"cxxboost_smart_ptr",
		"cxxboost_concept_check",
		"cxxboost_mpl"
	]
	static let path: String = "./Modules/cxxboost_numeric-ublas/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_optional {
	static let name: String = "cxxboost_optional"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_utility",
		"cxxboost_static_assert",
		"cxxboost_predef",
		"cxxboost_detail",
		"cxxboost_core",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_move",
		"cxxboost_throw_exception"
	]
	static let path: String = "./Modules/cxxboost_optional/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_outcome {
	static let name: String = "cxxboost_outcome"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_system",
		"cxxboost_exception",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_outcome/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_parameter {
	static let name: String = "cxxboost_parameter"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_mpl",
		"cxxboost_config",
		"cxxboost_function",
		"cxxboost_type_traits",
		"cxxboost_optional",
		"cxxboost_preprocessor",
		"cxxboost_core",
		"cxxboost_fusion",
		"cxxboost_utility",
		"cxxboost_mp11"
	]
	static let path: String = "./Modules/cxxboost_parameter/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_parameter_python {
	static let name: String = "cxxboost_parameter_python"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_python",
		"cxxboost_mpl",
		"cxxboost_preprocessor",
		"cxxboost_parameter"
		]
	static let path: String = "./Modules/cxxboost_parameter_python/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_pfr {
	static let name: String = "cxxboost_pfr"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_pfr/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_phoenix {
	static let name: String = "cxxboost_phoenix"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_fusion",
		"cxxboost_assert",
		"cxxboost_proto",
		"cxxboost_type_traits",
		"cxxboost_bind",
		"cxxboost_preprocessor",
		"cxxboost_range",
		"cxxboost_config",
		"cxxboost_utility",
		"cxxboost_function",
		"cxxboost_predef",
		"cxxboost_smart_ptr",
		"cxxboost_mpl",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_phoenix/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_poly_collection {
	static let name: String = "cxxboost_poly_collection"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_assert",
		"cxxboost_type_traits",
		"cxxboost_type_erasure",
		"cxxboost_mp11",
		"cxxboost_mpl",
		"cxxboost_core",
		"cxxboost_iterator"
	]
	static let path: String = "./Modules/cxxboost_poly_collection/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_polygon {
	static let name: String = "cxxboost_polygon"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_config"]
	static let path: String = "./Modules/cxxboost_polygon/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_pool {
	static let name: String = "cxxboost_pool"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_assert",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_winapi",
		"cxxboost_integer"
	]
	static let path: String = "./Modules/cxxboost_pool/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_predef {
	static let name: String = "cxxboost_predef"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_predef/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_preprocessor {
	static let name: String = "cxxboost_preprocessor"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_preprocessor/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_process {
	static let name: String = "cxxboost_process"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_io",
		"cxxboost_throw_exception",
		"cxxboost_optional",
		"cxxboost_fusion",
		"cxxboost_algorithm",
		"cxxboost_type_index",
		"cxxboost_filesystem",
		"cxxboost_tokenizer",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_system",
		"cxxboost_move",
		"cxxboost_asio",
		"cxxboost_iterator",
		"cxxboost_utility",
		"cxxboost_winapi"
	]
	static let path: String = "./Modules/cxxboost_process/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_program_options {
	static let name: String = "cxxboost_program_options"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_iterator",
		"cxxboost_config",
		"cxxboost_detail",
		"cxxboost_tokenizer",
		"cxxboost_smart_ptr",
		"cxxboost_bind",
		"cxxboost_lexical_cast",
		"cxxboost_core",
		"cxxboost_any",
		"cxxboost_throw_exception",
		"cxxboost_type_traits",
		"cxxboost_function",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_program_options/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_property_map {
	static let name: String = "cxxboost_property_map"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_type_traits",
		"cxxboost_any",
		"cxxboost_config",
		"cxxboost_function",
		"cxxboost_smart_ptr",
		"cxxboost_concept_check",
		"cxxboost_mpl",
		"cxxboost_static_assert",
		"cxxboost_type_index",
		"cxxboost_lexical_cast",
		"cxxboost_iterator",
		"cxxboost_throw_exception",
		"cxxboost_utility",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_property_map/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_property_map_parallel {
	static let name: String = "cxxboost_property_map_parallel"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_static_assert",
		"cxxboost_serialization",
		"cxxboost_assert",
		"cxxboost_property_map",
		"cxxboost_mpl",
		"cxxboost_smart_ptr",
		"cxxboost_optional",
		"cxxboost_mpi",
		"cxxboost_multi_index",
		"cxxboost_function",
		"cxxboost_concept_check",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_property_map_parallel/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_property_tree {
	static let name: String = "cxxboost_property_tree"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_iterator",
		"cxxboost_format",
		"cxxboost_bind",
		"cxxboost_config",
		"cxxboost_serialization",
		"cxxboost_any",
		"cxxboost_optional",
		"cxxboost_core",
		"cxxboost_multi_index",
		"cxxboost_type_traits",
		"cxxboost_range",
		"cxxboost_static_assert",
		"cxxboost_assert",
		"cxxboost_throw_exception",
		"cxxboost_mpl"
	]
	static let path: String = "./Modules/cxxboost_property_tree/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_proto {
	static let name: String = "cxxboost_proto"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_utility",
		"cxxboost_mpl",
		"cxxboost_type_traits",
		"cxxboost_typeof",
		"cxxboost_range",
		"cxxboost_config",
		"cxxboost_preprocessor",
		"cxxboost_static_assert",
		"cxxboost_fusion",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_proto/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_ptr_container {
	static let name: String = "cxxboost_ptr_container"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_utility",
		"cxxboost_mpl",
		"cxxboost_unordered",
		"cxxboost_iterator",
		"cxxboost_range",
		"cxxboost_circular_buffer",
		"cxxboost_type_traits",
		"cxxboost_smart_ptr",
		"cxxboost_config",
		"cxxboost_array",
		"cxxboost_assert",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_ptr_container/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_python {
	static let name: String = "cxxboost_python"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_smart_ptr",
		"cxxboost_preprocessor",
		"cxxboost_align",
		"cxxboost_detail",
		"cxxboost_mpl",
		"cxxboost_integer",
		"cxxboost_foreach",
		"cxxboost_property_map",
		"cxxboost_conversion",
		"cxxboost_static_assert",
		"cxxboost_function",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_core",
		"cxxboost_numeric-conversion",
		"cxxboost_bind",
		"cxxboost_utility",
		"cxxboost_graph",
		"cxxboost_lexical_cast",
		"cxxboost_iterator",
		"cxxboost_tuple"
	]
	static let path: String = "./Modules/cxxboost_python/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_qvm {
	static let name: String = "cxxboost_qvm"
	static let dependencies: Array<Target.Dependency> = []
	static let path: String = "./Modules/cxxboost_qvm/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_random {
	static let name: String = "cxxboost_random"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_throw_exception",
		"cxxboost_integer",
		"cxxboost_core",
		"cxxboost_static_assert",
		"cxxboost_utility",
		"cxxboost_io",
		"cxxboost_range",
		"cxxboost_config",
		"cxxboost_array",
		"cxxboost_system",
		"cxxboost_type_traits",
		"cxxboost_dynamic_bitset"
	]
	static let path: String = "./Modules/cxxboost_random/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_range {
	static let name: String = "cxxboost_range"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_regex",
		"cxxboost_container_hash",
		"cxxboost_utility",
		"cxxboost_preprocessor",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_mpl",
		"cxxboost_tuple",
		"cxxboost_concept_check",
		"cxxboost_array",
		"cxxboost_conversion",
		"cxxboost_core",
		"cxxboost_assert",
		"cxxboost_iterator",
		"cxxboost_detail",
		"cxxboost_optional",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_range/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_ratio {
	static let name: String = "cxxboost_ratio"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_mpl",
		"cxxboost_type_traits",
		"cxxboost_rational",
		"cxxboost_core",
		"cxxboost_integer",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_ratio/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_rational {
	static let name: String = "cxxboost_rational"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_utility",
		"cxxboost_static_assert",
		"cxxboost_core",
		"cxxboost_throw_exception",
		"cxxboost_config",
		"cxxboost_assert",
		"cxxboost_type_traits",
		"cxxboost_integer"
	]
	static let path: String = "./Modules/cxxboost_rational/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_regex {
	static let name: String = "cxxboost_regex"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_smart_ptr",
		"cxxboost_mpl",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_integer",
		"cxxboost_static_assert",
		"cxxboost_concept_check",
		"cxxboost_predef",
		"cxxboost_container_hash",
		"cxxboost_core",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_regex/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_safe_numerics {
	static let name: String = "cxxboost_safe_numerics"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_mp11",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_logic",
		"cxxboost_concept_check",
		"cxxboost_integer"
	]
	static let path: String = "./Modules/cxxboost_safe_numerics/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_scope_exit {
	static let name: String = "cxxboost_scope_exit"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_typeof",
		"cxxboost_preprocessor",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_function"
	]
	static let path: String = "./Modules/cxxboost_scope_exit/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_serialization {
	static let name: String = "cxxboost_serialization"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_spirit",
		"cxxboost_detail",
		"cxxboost_io",
		"cxxboost_integer",
		"cxxboost_variant",
		"cxxboost_type_traits",
		"cxxboost_function",
		"cxxboost_preprocessor",
		"cxxboost_predef",
		"cxxboost_unordered",
		"cxxboost_utility",
		"cxxboost_core",
		"cxxboost_array",
		"cxxboost_static_assert",
		"cxxboost_smart_ptr",
		"cxxboost_move",
		"cxxboost_optional",
		"cxxboost_config",
		"cxxboost_iterator",
		"cxxboost_assert",
		"cxxboost_mpl"
	]
	static let path: String = "./Modules/cxxboost_serialization/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_signals2 {
	static let name: String = "cxxboost_signals2"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_tuple",
		"cxxboost_preprocessor",
		"cxxboost_throw_exception",
		"cxxboost_mpl",
		"cxxboost_config",
		"cxxboost_optional",
		"cxxboost_parameter",
		"cxxboost_core",
		"cxxboost_iterator",
		"cxxboost_bind",
		"cxxboost_function",
		"cxxboost_type_traits",
		"cxxboost_predef",
		"cxxboost_smart_ptr",
		"cxxboost_assert",
		"cxxboost_variant"
	]
	static let path: String = "./Modules/cxxboost_signals2/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_smart_ptr {
	static let name: String = "cxxboost_smart_ptr"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_assert",
		"cxxboost_move",
		"cxxboost_core",
		"cxxboost_type_traits",
		"cxxboost_throw_exception",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_smart_ptr/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_sort {
	static let name: String = "cxxboost_sort"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_range",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_sort/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_spirit {
	static let name: String = "cxxboost_spirit"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_endian",
		"cxxboost_typeof",
		"cxxboost_mpl",
		"cxxboost_thread",
		"cxxboost_move",
		"cxxboost_type_traits",
		"cxxboost_assert",
		"cxxboost_pool",
		"cxxboost_preprocessor",
		"cxxboost_static_assert",
		"cxxboost_integer",
		"cxxboost_fusion",
		"cxxboost_throw_exception",
		"cxxboost_iterator",
		"cxxboost_io",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_function",
		"cxxboost_optional",
		"cxxboost_proto",
		"cxxboost_function_types",
		"cxxboost_unordered",
		"cxxboost_variant",
		"cxxboost_range",
		"cxxboost_smart_ptr",
		"cxxboost_regex",
		"cxxboost_utility",
		"cxxboost_array",
		"cxxboost_phoenix"
	]
	static let path: String = "./Modules/cxxboost_spirit/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_stacktrace {
	static let name: String = "cxxboost_stacktrace"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_predef",
		"cxxboost_type_traits",
		"cxxboost_container_hash",
		"cxxboost_config",
		"cxxboost_array",
		"cxxboost_core",
		"cxxboost_winapi",
		"cxxboost_static_assert"
	]
	static let path: String = "./Modules/cxxboost_stacktrace/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_statechart {
	static let name: String = "cxxboost_statechart"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_thread",
		"cxxboost_bind",
		"cxxboost_conversion",
		"cxxboost_core",
		"cxxboost_mpl",
		"cxxboost_type_traits",
		"cxxboost_static_assert",
		"cxxboost_config",
		"cxxboost_smart_ptr",
		"cxxboost_detail",
		"cxxboost_function"
	]
	static let path: String = "./Modules/cxxboost_statechart/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_static_assert {
	static let name: String = "cxxboost_static_assert"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_config"]
	static let path: String = "./Modules/cxxboost_static_assert/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_static_string {
	static let name: String = "cxxboost_static_string"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_container_hash",
		"cxxboost_static_assert",
		"cxxboost_utility",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_static_string/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_stl_interfaces {
	static let name: String = "cxxboost_stl_interfaces"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_assert",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_stl_interfaces/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_system {
	static let name: String = "cxxboost_system"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_variant2",
		"cxxboost_config",
		"cxxboost_winapi",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_system/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_test {
	static let name: String = "cxxboost_test"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_preprocessor",
		"cxxboost_assert",
		"cxxboost_config",
		"cxxboost_detail",
		"cxxboost_bind",
		"cxxboost_core",
		"cxxboost_exception",
		"cxxboost_smart_ptr",
		"cxxboost_algorithm",
		"cxxboost_iterator",
		"cxxboost_function",
		"cxxboost_io",
		"cxxboost_mpl",
		"cxxboost_utility",
		"cxxboost_numeric-conversion",
		"cxxboost_static_assert",
		"cxxboost_type_traits",
		"cxxboost_optional"
	]
	static let path: String = "./Modules/cxxboost_test/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_thread {
	static let name: String = "cxxboost_thread"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_preprocessor",
		"cxxboost_predef",
		"cxxboost_winapi",
		"cxxboost_concept_check",
		"cxxboost_system",
		"cxxboost_static_assert",
		"cxxboost_chrono",
		"cxxboost_io",
		"cxxboost_function",
		"cxxboost_optional",
		"cxxboost_container_hash",
		"cxxboost_config",
		"cxxboost_smart_ptr",
		"cxxboost_container",
		"cxxboost_exception",
		"cxxboost_algorithm",
		"cxxboost_atomic",
		"cxxboost_iterator",
		"cxxboost_assert",
		"cxxboost_lexical_cast",
		"cxxboost_bind",
		"cxxboost_date_time",
		"cxxboost_throw_exception",
		"cxxboost_core",
		"cxxboost_type_traits",
		"cxxboost_move",
		"cxxboost_utility",
		"cxxboost_tuple",
		"cxxboost_intrusive"
	]
	static let path: String = "./Modules/cxxboost_thread/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_throw_exception {
	static let name: String = "cxxboost_throw_exception"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_config", "cxxboost_assert"]
	static let path: String = "./Modules/cxxboost_throw_exception/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_timer {
	static let name: String = "cxxboost_timer"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_system",
		"cxxboost_chrono",
		"cxxboost_predef",
		"cxxboost_config",
		"cxxboost_core",
		"cxxboost_io"
	]
	static let path: String = "./Modules/cxxboost_timer/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_tokenizer {
	static let name: String = "cxxboost_tokenizer"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_iterator",
		"cxxboost_config",
		"cxxboost_assert",
		"cxxboost_throw_exception",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_tokenizer/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_tti {
	static let name: String = "cxxboost_tti"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_mpl",
		"cxxboost_config",
		"cxxboost_type_traits",
		"cxxboost_preprocessor",
		"cxxboost_function_types"
	]
	static let path: String = "./Modules/cxxboost_tti/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_tuple {
	static let name: String = "cxxboost_tuple"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_static_assert",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_tuple/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_type_erasure {
	static let name: String = "cxxboost_type_erasure"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_vmd",
		"cxxboost_throw_exception",
		"cxxboost_iterator",
		"cxxboost_mpl",
		"cxxboost_assert",
		"cxxboost_mp11",
		"cxxboost_thread",
		"cxxboost_typeof",
		"cxxboost_config",
		"cxxboost_fusion",
		"cxxboost_preprocessor",
		"cxxboost_smart_ptr",
		"cxxboost_core",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_type_erasure/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_type_index {
	static let name: String = "cxxboost_type_index"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_core",
		"cxxboost_preprocessor",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_container_hash",
		"cxxboost_throw_exception"
	]
	static let path: String = "./Modules/cxxboost_type_index/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_type_traits {
	static let name: String = "cxxboost_type_traits"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_static_assert", "cxxboost_config"]
	static let path: String = "./Modules/cxxboost_type_traits/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_typeof {
	static let name: String = "cxxboost_typeof"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_preprocessor",
		"cxxboost_config",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_typeof/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_units {
	static let name: String = "cxxboost_units"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_config",
		"cxxboost_core",
		"cxxboost_mpl",
		"cxxboost_typeof",
		"cxxboost_math",
		"cxxboost_static_assert",
		"cxxboost_lambda",
		"cxxboost_type_traits",
		"cxxboost_io",
		"cxxboost_integer",
		"cxxboost_preprocessor",
		"cxxboost_assert"
	]
	static let path: String = "./Modules/cxxboost_units/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_unordered {
	static let name: String = "cxxboost_unordered"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_static_assert",
		"cxxboost_container_hash",
		"cxxboost_mp11",
		"cxxboost_preprocessor",
		"cxxboost_throw_exception",
		"cxxboost_core",
		"cxxboost_config",
		"cxxboost_move",
		"cxxboost_tuple",
		"cxxboost_type_traits",
		"cxxboost_assert",
		"cxxboost_predef"
	]
	static let path: String = "./Modules/cxxboost_unordered/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_url {
	static let name: String = "cxxboost_url"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_throw_exception",
		"cxxboost_assert",
		"cxxboost_system",
		"cxxboost_variant2",
		"cxxboost_mp11",
		"cxxboost_static_assert",
		"cxxboost_align",
		"cxxboost_type_traits",
		"cxxboost_config",
		"cxxboost_core",
		"cxxboost_optional"
	]
	static let path: String = "./Modules/cxxboost_url/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_utility {
	static let name: String = "cxxboost_utility"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_type_traits",
		"cxxboost_assert",
		"cxxboost_io",
		"cxxboost_preprocessor",
		"cxxboost_config",
		"cxxboost_throw_exception",
		"cxxboost_core"
	]
	static let path: String = "./Modules/cxxboost_utility/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_uuid {
	static let name: String = "cxxboost_uuid"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_config",
		"cxxboost_random",
		"cxxboost_numeric-conversion",
		"cxxboost_predef",
		"cxxboost_io",
		"cxxboost_throw_exception",
		"cxxboost_move",
		"cxxboost_core",
		"cxxboost_tti",
		"cxxboost_winapi",
		"cxxboost_container_hash",
		"cxxboost_static_assert",
		"cxxboost_type_traits"
	]
	static let path: String = "./Modules/cxxboost_uuid/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_variant {
	static let name: String = "cxxboost_variant"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_container_hash",
		"cxxboost_detail",
		"cxxboost_type_index",
		"cxxboost_bind",
		"cxxboost_throw_exception",
		"cxxboost_config",
		"cxxboost_utility",
		"cxxboost_type_traits",
		"cxxboost_integer",
		"cxxboost_static_assert",
		"cxxboost_core",
		"cxxboost_assert",
		"cxxboost_move",
		"cxxboost_preprocessor",
		"cxxboost_mpl"
	]
	static let path: String = "./Modules/cxxboost_variant/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_variant2 {
	static let name: String = "cxxboost_variant2"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_assert",
		"cxxboost_mp11",
		"cxxboost_config"
	]
	static let path: String = "./Modules/cxxboost_variant2/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_vmd {
	static let name: String = "cxxboost_vmd"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_preprocessor"]
	static let path: String = "./Modules/cxxboost_vmd/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_wave {
	static let name: String = "cxxboost_wave"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_core",
		"cxxboost_multi_index",
		"cxxboost_lexical_cast",
		"cxxboost_assert",
		"cxxboost_smart_ptr",
		"cxxboost_format",
		"cxxboost_static_assert",
		"cxxboost_type_traits",
		"cxxboost_filesystem",
		"cxxboost_mpl",
		"cxxboost_spirit",
		"cxxboost_config",
		"cxxboost_serialization",
		"cxxboost_iterator",
		"cxxboost_optional",
		"cxxboost_concept_check",
		"cxxboost_throw_exception",
		"cxxboost_pool",
		"cxxboost_preprocessor"
	]
	static let path: String = "./Modules/cxxboost_wave/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = ["src"]
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_winapi {
	static let name: String = "cxxboost_winapi"
	static let dependencies: Array<Target.Dependency> = ["cxxboost_predef", "cxxboost_config"]
	static let path: String = "./Modules/cxxboost_winapi/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_xpressive {
	static let name: String = "cxxboost_xpressive"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_smart_ptr",
		"cxxboost_config",
		"cxxboost_static_assert",
		"cxxboost_range",
		"cxxboost_type_traits",
		"cxxboost_conversion",
		"cxxboost_numeric-conversion",
		"cxxboost_proto",
		"cxxboost_typeof",
		"cxxboost_assert",
		"cxxboost_preprocessor",
		"cxxboost_core",
		"cxxboost_utility",
		"cxxboost_throw_exception",
		"cxxboost_iterator",
		"cxxboost_lexical_cast",
		"cxxboost_mpl",
		"cxxboost_integer",
		"cxxboost_exception",
		"cxxboost_fusion",
		"cxxboost_optional"
	]
	static let path: String = "./Modules/cxxboost_xpressive/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}
fileprivate struct cxxboost_yap {
	static let name: String = "cxxboost_yap"
	static let dependencies: Array<Target.Dependency> = [
		"cxxboost_hana",
		"cxxboost_preprocessor",
		"cxxboost_type_index"
	]
	static let path: String = "./Modules/cxxboost_yap/"
	static let exclude: Array<String> = [".cant-see-me"]
	static let sources: Array<String> = []
	static let publicHeadersPath: String = "include"
	static let packageAccess: Bool = false
}

let package = Package(
	name: "cxxboost",
	platforms: [.macOS(.v13)],
	products: [
		.library(name: cxxboost_yap.name targets: [cxxboost_yap.name]),
		.library(name: cxxboost_xpressive.name targets: [cxxboost_xpressive.name]),
		.library(name: cxxboost_winapi.name targets: [cxxboost_winapi.name]),
		.library(name: cxxboost_wave.name targets: [cxxboost_wave.name]),
		.library(name: cxxboost_vmd.name targets: [cxxboost_vmd.name]),
		.library(name: cxxboost_variant2.name targets: [cxxboost_variant2.name]),
		.library(name: cxxboost_variant.name targets: [cxxboost_variant.name]),
		.library(name: cxxboost_uuid.name targets: [cxxboost_uuid.name]),
		.library(name: cxxboost_utility.name targets: [cxxboost_utility.name]),
		.library(name: cxxboost_url.name targets: [cxxboost_url.name]),
		.library(name: cxxboost_unordered.name targets: [cxxboost_unordered.name]),
		.library(name: cxxboost_units.name targets: [cxxboost_units.name]),
		.library(name: cxxboost_typeof.name targets: [cxxboost_typeof.name]),
		.library(name: cxxboost_type_traits.name targets: [cxxboost_type_traits.name]),
		.library(name: cxxboost_type_index.name targets: [cxxboost_type_index.name]),
		.library(name: cxxboost_type_erasure.name targets: [cxxboost_type_erasure.name]),
		.library(name: cxxboost_tuple.name targets: [cxxboost_tuple.name]),
		.library(name: cxxboost_tti.name targets: [cxxboost_tti.name]),
		.library(name: cxxboost_tokenizer.name targets: [cxxboost_tokenizer.name]),
		.library(name: cxxboost_timer.name targets: [cxxboost_timer.name]),
		.library(name: cxxboost_throw_exception.name targets: [cxxboost_throw_exception.name]),
		.library(name: cxxboost_thread.name targets: [cxxboost_thread.name]),
		.library(name: cxxboost_test.name targets: [cxxboost_test.name]),
		.library(name: cxxboost_system.name targets: [cxxboost_system.name]),
		.library(name: cxxboost_stl_interfaces.name targets: [cxxboost_stl_interfaces.name]),
		.library(name: cxxboost_static_string.name targets: [cxxboost_static_string.name]),
		.library(name: cxxboost_static_assert.name targets: [cxxboost_static_assert.name]),
		.library(name: cxxboost_statechart.name targets: [cxxboost_statechart.name]),
		.library(name: cxxboost_stacktrace.name targets: [cxxboost_stacktrace.name]),
		.library(name: cxxboost_spirit.name targets: [cxxboost_spirit.name]),
		.library(name: cxxboost_sort.name targets: [cxxboost_sort.name]),
		.library(name: cxxboost_smart_ptr.name targets: [cxxboost_smart_ptr.name]),
		.library(name: cxxboost_signals2.name targets: [cxxboost_signals2.name]),
		.library(name: cxxboost_serialization.name targets: [cxxboost_serialization.name]),
		.library(name: cxxboost_scope_exit.name targets: [cxxboost_scope_exit.name]),
		.library(name: cxxboost_safe_numerics.name targets: [cxxboost_safe_numerics.name]),
		.library(name: cxxboost_regex.name targets: [cxxboost_regex.name]),
		.library(name: cxxboost_rational.name targets: [cxxboost_rational.name]),
		.library(name: cxxboost_ratio.name targets: [cxxboost_ratio.name]),
		.library(name: cxxboost_range.name targets: [cxxboost_range.name]),
		.library(name: cxxboost_random.name targets: [cxxboost_random.name]),
		.library(name: cxxboost_qvm.name targets: [cxxboost_qvm.name]),
		.library(name: cxxboost_python.name targets: [cxxboost_python.name]),
		.library(name: cxxboost_ptr_container.name targets: [cxxboost_ptr_container.name]),
		.library(name: cxxboost_proto.name targets: [cxxboost_proto.name]),
		.library(name: cxxboost_property_tree.name targets: [cxxboost_property_tree.name]),
		.library(name: cxxboost_property_map_parallel.name targets: [cxxboost_property_map_parallel.name]),
		.library(name: cxxboost_property_map.name targets: [cxxboost_property_map.name]),
		.library(name: cxxboost_program_options.name targets: [cxxboost_program_options.name]),
		.library(name: cxxboost_process.name targets: [cxxboost_process.name]),
		.library(name: cxxboost_preprocessor.name targets: [cxxboost_preprocessor.name]),
		.library(name: cxxboost_predef.name targets: [cxxboost_predef.name]),
		.library(name: cxxboost_pool.name targets: [cxxboost_pool.name]),
		.library(name: cxxboost_polygon.name targets: [cxxboost_polygon.name]),
		.library(name: cxxboost_poly_collection.name targets: [cxxboost_poly_collection.name]),
		.library(name: cxxboost_phoenix.name targets: [cxxboost_phoenix.name]),
		.library(name: cxxboost_pfr.name targets: [cxxboost_pfr.name]),
		.library(name: cxxboost_parameter_python.name targets: [cxxboost_parameter_python.name]),
		.library(name: cxxboost_parameter.name targets: [cxxboost_parameter.name]),
		.library(name: cxxboost_outcome.name targets: [cxxboost_outcome.name]),
		.library(name: cxxboost_optional.name targets: [cxxboost_optional.name]),
		.library(name: cxxboost_numeric-ublas.name targets: [cxxboost_numeric-ublas.name]),
		.library(name: cxxboost_numeric-odeint.name targets: [cxxboost_numeric-odeint.name]),
		.library(name: cxxboost_numeric-interval.name targets: [cxxboost_numeric-interval.name]),
		.library(name: cxxboost_numeric-conversion.name targets: [cxxboost_numeric-conversion.name]),
		.library(name: cxxboost_nowide.name targets: [cxxboost_nowide.name]),
		.library(name: cxxboost_mysql.name targets: [cxxboost_mysql.name]),
		.library(name: cxxboost_multiprecision.name targets: [cxxboost_multiprecision.name]),
		.library(name: cxxboost_multi_index.name targets: [cxxboost_multi_index.name]),
		.library(name: cxxboost_multi_array.name targets: [cxxboost_multi_array.name]),
		.library(name: cxxboost_msm.name targets: [cxxboost_msm.name]),
		.library(name: cxxboost_mpl.name targets: [cxxboost_mpl.name]),
		.library(name: cxxboost_mpi.name targets: [cxxboost_mpi.name]),
		.library(name: cxxboost_mp11.name targets: [cxxboost_mp11.name]),
		.library(name: cxxboost_move.name targets: [cxxboost_move.name]),
		.library(name: cxxboost_metaparse.name targets: [cxxboost_metaparse.name]),
		.library(name: cxxboost_math.name targets: [cxxboost_math.name]),
		.library(name: cxxboost_logic.name targets: [cxxboost_logic.name]),
		.library(name: cxxboost_log.name targets: [cxxboost_log.name]),
		.library(name: cxxboost_lockfree.name targets: [cxxboost_lockfree.name]),
		.library(name: cxxboost_locale.name targets: [cxxboost_locale.name]),
		.library(name: cxxboost_local_function.name targets: [cxxboost_local_function.name]),
		.library(name: cxxboost_lexical_cast.name targets: [cxxboost_lexical_cast.name]),
		.library(name: cxxboost_leaf.name targets: [cxxboost_leaf.name]),
		.library(name: cxxboost_lambda2.name targets: [cxxboost_lambda2.name]),
		.library(name: cxxboost_lambda.name targets: [cxxboost_lambda.name]),
		.library(name: cxxboost_json.name targets: [cxxboost_json.name]),
		.library(name: cxxboost_iterator.name targets: [cxxboost_iterator.name]),
		.library(name: cxxboost_iostreams.name targets: [cxxboost_iostreams.name]),
		.library(name: cxxboost_io.name targets: [cxxboost_io.name]),
		.library(name: cxxboost_intrusive.name targets: [cxxboost_intrusive.name]),
		.library(name: cxxboost_interprocess.name targets: [cxxboost_interprocess.name]),
		.library(name: cxxboost_integer.name targets: [cxxboost_integer.name]),
		.library(name: cxxboost_icl.name targets: [cxxboost_icl.name]),
		.library(name: cxxboost_hof.name targets: [cxxboost_hof.name]),
		.library(name: cxxboost_histogram.name targets: [cxxboost_histogram.name]),
		.library(name: cxxboost_heap.name targets: [cxxboost_heap.name]),
		.library(name: cxxboost_headers.name targets: [cxxboost_headers.name]),
		.library(name: cxxboost_hana.name targets: [cxxboost_hana.name]),
		.library(name: cxxboost_graph_parallel.name targets: [cxxboost_graph_parallel.name]),
		.library(name: cxxboost_graph.name targets: [cxxboost_graph.name]),
		.library(name: cxxboost_gil.name targets: [cxxboost_gil.name]),
		.library(name: cxxboost_geometry.name targets: [cxxboost_geometry.name]),
		.library(name: cxxboost_fusion.name targets: [cxxboost_fusion.name]),
		.library(name: cxxboost_functional.name targets: [cxxboost_functional.name]),
		.library(name: cxxboost_function_types.name targets: [cxxboost_function_types.name]),
		.library(name: cxxboost_function.name targets: [cxxboost_function.name]),
		.library(name: cxxboost_format.name targets: [cxxboost_format.name]),
		.library(name: cxxboost_foreach.name targets: [cxxboost_foreach.name]),
		.library(name: cxxboost_flyweight.name targets: [cxxboost_flyweight.name]),
		.library(name: cxxboost_filesystem.name targets: [cxxboost_filesystem.name]),
		.library(name: cxxboost_fiber.name targets: [cxxboost_fiber.name]),
		.library(name: cxxboost_exception.name targets: [cxxboost_exception.name]),
		.library(name: cxxboost_endian.name targets: [cxxboost_endian.name]),
		.library(name: cxxboost_dynamic_bitset.name targets: [cxxboost_dynamic_bitset.name]),
		.library(name: cxxboost_dll.name targets: [cxxboost_dll.name]),
		.library(name: cxxboost_detail.name targets: [cxxboost_detail.name]),
		.library(name: cxxboost_describe.name targets: [cxxboost_describe.name]),
		.library(name: cxxboost_date_time.name targets: [cxxboost_date_time.name]),
		.library(name: cxxboost_crc.name targets: [cxxboost_crc.name]),
		.library(name: cxxboost_coroutine2.name targets: [cxxboost_coroutine2.name]),
		.library(name: cxxboost_coroutine.name targets: [cxxboost_coroutine.name]),
		.library(name: cxxboost_core.name targets: [cxxboost_core.name]),
		.library(name: cxxboost_convert.name targets: [cxxboost_convert.name]),
		.library(name: cxxboost_conversion.name targets: [cxxboost_conversion.name]),
		.library(name: cxxboost_contract.name targets: [cxxboost_contract.name]),
		.library(name: cxxboost_context.name targets: [cxxboost_context.name]),
		.library(name: cxxboost_container_hash.name targets: [cxxboost_container_hash.name]),
		.library(name: cxxboost_container.name targets: [cxxboost_container.name]),
		.library(name: cxxboost_config.name targets: [cxxboost_config.name]),
		.library(name: cxxboost_concept_check.name targets: [cxxboost_concept_check.name]),
		.library(name: cxxboost_compute.name targets: [cxxboost_compute.name]),
		.library(name: cxxboost_compatibility.name targets: [cxxboost_compatibility.name]),
		.library(name: cxxboost_circular_buffer.name targets: [cxxboost_circular_buffer.name]),
		.library(name: cxxboost_chrono.name targets: [cxxboost_chrono.name]),
		.library(name: cxxboost_callable_traits.name targets: [cxxboost_callable_traits.name]),
		.library(name: cxxboost_bind.name targets: [cxxboost_bind.name]),
		.library(name: cxxboost_bimap.name targets: [cxxboost_bimap.name]),
		.library(name: cxxboost_beast.name targets: [cxxboost_beast.name]),
		.library(name: cxxboost_atomic.name targets: [cxxboost_atomic.name]),
		.library(name: cxxboost_assign.name targets: [cxxboost_assign.name]),
		.library(name: cxxboost_assert.name targets: [cxxboost_assert.name]),
		.library(name: cxxboost_asio.name targets: [cxxboost_asio.name]),
		.library(name: cxxboost_array.name targets: [cxxboost_array.name]),
		.library(name: cxxboost_any.name targets: [cxxboost_any.name]),
		.library(name: cxxboost_align.name targets: [cxxboost_align.name]),
		.library(name: cxxboost_algorithm.name targets: [cxxboost_algorithm.name]),
		.library(name: cxxboost_accumulators.name targets: [cxxboost_accumulators.name])
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
		.package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
		.package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.0.0"),
		.package(url: "https://github.com/tannerdsilva/SwiftSlash.git", from: "3.4.0")
	],
	targets: [
		.systemLibrary(
			name: "libopenmpi",
			path: "./libopenmpi",
			pkgConfig: "ompi",
			providers: [.apt(["libopenmpi-dev"]), .brew(["open-mpi"])]
		),
		.plugin(name: "_boost_master_buildtool", capability: .buildTool(), dependencies: ["_boost_master_prep"]),
		.plugin(name: "_boost_master_package_render", capability: .command(intent: .custom(verb: "package-render", description: "render the target information into the package description"), permissions: [.writeToPackageDirectory(reason: "needs to manage submodules in master repo")]), dependencies: ["_boost_master_prep"]),
		.plugin(name: "_boost_master_prep_plugin", capability: .command(intent: .custom(verb: "boost-checkout", description: "prepare boost and all of its submodules from source for building."), permissions: [.writeToPackageDirectory(reason: "needs to manage submodules in master repo"), .allowNetworkConnections(scope: .all(), reason: "downloading boost source code")]), dependencies: ["_boost_master_prep"]),
		.executableTarget(name: "_boost_master_prep", dependencies: [
				.product(name: "SwiftBasicFormat", package: "swift-syntax"),
				.product(name: "SwiftParser", package: "swift-syntax"),
				.product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
				.product(name: "SwiftSyntax", package: "swift-syntax"),
				.product(name: "Logging", package: "swift-log"),
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
				.product(name: "SwiftSlash", package: "SwiftSlash")
			]),
		.target(
			name: cxxboost_static_string.name,
			dependencies: cxxboost_static_string.dependencies,
			path: cxxboost_static_string.path,
			exclude: cxxboost_static_string.exclude,
			sources: cxxboost_static_string.sources,
			publicHeadersPath: cxxboost_static_string.publicHeadersPath,
			packageAccess: cxxboost_static_string.packageAccess
		),
		.target(
			name: cxxboost_metaparse.name,
			dependencies: cxxboost_metaparse.dependencies,
			path: cxxboost_metaparse.path,
			exclude: cxxboost_metaparse.exclude,
			sources: cxxboost_metaparse.sources,
			publicHeadersPath: cxxboost_metaparse.publicHeadersPath,
			packageAccess: cxxboost_metaparse.packageAccess
		),
		.target(
			name: cxxboost_wave.name,
			dependencies: cxxboost_wave.dependencies,
			path: cxxboost_wave.path,
			exclude: cxxboost_wave.exclude,
			sources: cxxboost_wave.sources,
			publicHeadersPath: cxxboost_wave.publicHeadersPath,
			packageAccess: cxxboost_wave.packageAccess
		),
		.target(
			name: cxxboost_chrono.name,
			dependencies: cxxboost_chrono.dependencies,
			path: cxxboost_chrono.path,
			exclude: cxxboost_chrono.exclude,
			sources: cxxboost_chrono.sources,
			publicHeadersPath: cxxboost_chrono.publicHeadersPath,
			packageAccess: cxxboost_chrono.packageAccess
		),
		.target(
			name: cxxboost_functional.name,
			dependencies: cxxboost_functional.dependencies,
			path: cxxboost_functional.path,
			exclude: cxxboost_functional.exclude,
			sources: cxxboost_functional.sources,
			publicHeadersPath: cxxboost_functional.publicHeadersPath,
			packageAccess: cxxboost_functional.packageAccess
		),
		.target(
			name: cxxboost_dll.name,
			dependencies: cxxboost_dll.dependencies,
			path: cxxboost_dll.path,
			exclude: cxxboost_dll.exclude,
			sources: cxxboost_dll.sources,
			publicHeadersPath: cxxboost_dll.publicHeadersPath,
			packageAccess: cxxboost_dll.packageAccess
		),
		.target(
			name: cxxboost_assert.name,
			dependencies: cxxboost_assert.dependencies,
			path: cxxboost_assert.path,
			exclude: cxxboost_assert.exclude,
			sources: cxxboost_assert.sources,
			publicHeadersPath: cxxboost_assert.publicHeadersPath,
			packageAccess: cxxboost_assert.packageAccess
		),
		.target(
			name: cxxboost_program_options.name,
			dependencies: cxxboost_program_options.dependencies,
			path: cxxboost_program_options.path,
			exclude: cxxboost_program_options.exclude,
			sources: cxxboost_program_options.sources,
			publicHeadersPath: cxxboost_program_options.publicHeadersPath,
			packageAccess: cxxboost_program_options.packageAccess
		),
		.target(
			name: cxxboost_qvm.name,
			dependencies: cxxboost_qvm.dependencies,
			path: cxxboost_qvm.path,
			exclude: cxxboost_qvm.exclude,
			sources: cxxboost_qvm.sources,
			publicHeadersPath: cxxboost_qvm.publicHeadersPath,
			packageAccess: cxxboost_qvm.packageAccess
		),
		.target(
			name: cxxboost_tokenizer.name,
			dependencies: cxxboost_tokenizer.dependencies,
			path: cxxboost_tokenizer.path,
			exclude: cxxboost_tokenizer.exclude,
			sources: cxxboost_tokenizer.sources,
			publicHeadersPath: cxxboost_tokenizer.publicHeadersPath,
			packageAccess: cxxboost_tokenizer.packageAccess
		),
		.target(
			name: cxxboost_conversion.name,
			dependencies: cxxboost_conversion.dependencies,
			path: cxxboost_conversion.path,
			exclude: cxxboost_conversion.exclude,
			sources: cxxboost_conversion.sources,
			publicHeadersPath: cxxboost_conversion.publicHeadersPath,
			packageAccess: cxxboost_conversion.packageAccess
		),
		.target(
			name: cxxboost_filesystem.name,
			dependencies: cxxboost_filesystem.dependencies,
			path: cxxboost_filesystem.path,
			exclude: cxxboost_filesystem.exclude,
			sources: cxxboost_filesystem.sources,
			publicHeadersPath: cxxboost_filesystem.publicHeadersPath,
			packageAccess: cxxboost_filesystem.packageAccess
		),
		.target(
			name: cxxboost_compute.name,
			dependencies: cxxboost_compute.dependencies,
			path: cxxboost_compute.path,
			exclude: cxxboost_compute.exclude,
			sources: cxxboost_compute.sources,
			publicHeadersPath: cxxboost_compute.publicHeadersPath,
			packageAccess: cxxboost_compute.packageAccess
		),
		.target(
			name: cxxboost_predef.name,
			dependencies: cxxboost_predef.dependencies,
			path: cxxboost_predef.path,
			exclude: cxxboost_predef.exclude,
			sources: cxxboost_predef.sources,
			publicHeadersPath: cxxboost_predef.publicHeadersPath,
			packageAccess: cxxboost_predef.packageAccess
		),
		.target(
			name: cxxboost_vmd.name,
			dependencies: cxxboost_vmd.dependencies,
			path: cxxboost_vmd.path,
			exclude: cxxboost_vmd.exclude,
			sources: cxxboost_vmd.sources,
			publicHeadersPath: cxxboost_vmd.publicHeadersPath,
			packageAccess: cxxboost_vmd.packageAccess
		),
		.target(
			name: cxxboost_smart_ptr.name,
			dependencies: cxxboost_smart_ptr.dependencies,
			path: cxxboost_smart_ptr.path,
			exclude: cxxboost_smart_ptr.exclude,
			sources: cxxboost_smart_ptr.sources,
			publicHeadersPath: cxxboost_smart_ptr.publicHeadersPath,
			packageAccess: cxxboost_smart_ptr.packageAccess
		),
		.target(
			name: cxxboost_contract.name,
			dependencies: cxxboost_contract.dependencies,
			path: cxxboost_contract.path,
			exclude: cxxboost_contract.exclude,
			sources: cxxboost_contract.sources,
			publicHeadersPath: cxxboost_contract.publicHeadersPath,
			packageAccess: cxxboost_contract.packageAccess
		),
		.target(
			name: cxxboost_icl.name,
			dependencies: cxxboost_icl.dependencies,
			path: cxxboost_icl.path,
			exclude: cxxboost_icl.exclude,
			sources: cxxboost_icl.sources,
			publicHeadersPath: cxxboost_icl.publicHeadersPath,
			packageAccess: cxxboost_icl.packageAccess
		),
		.target(
			name: cxxboost_exception.name,
			dependencies: cxxboost_exception.dependencies,
			path: cxxboost_exception.path,
			exclude: cxxboost_exception.exclude,
			sources: cxxboost_exception.sources,
			publicHeadersPath: cxxboost_exception.publicHeadersPath,
			packageAccess: cxxboost_exception.packageAccess
		),
		.target(
			name: cxxboost_intrusive.name,
			dependencies: cxxboost_intrusive.dependencies,
			path: cxxboost_intrusive.path,
			exclude: cxxboost_intrusive.exclude,
			sources: cxxboost_intrusive.sources,
			publicHeadersPath: cxxboost_intrusive.publicHeadersPath,
			packageAccess: cxxboost_intrusive.packageAccess
		),
		.target(
			name: cxxboost_mpi.name,
			dependencies: cxxboost_mpi.dependencies,
			path: cxxboost_mpi.path,
			exclude: cxxboost_mpi.exclude,
			sources: cxxboost_mpi.sources,
			publicHeadersPath: cxxboost_mpi.publicHeadersPath,
			packageAccess: cxxboost_mpi.packageAccess
		),
		.target(
			name: cxxboost_xpressive.name,
			dependencies: cxxboost_xpressive.dependencies,
			path: cxxboost_xpressive.path,
			exclude: cxxboost_xpressive.exclude,
			sources: cxxboost_xpressive.sources,
			publicHeadersPath: cxxboost_xpressive.publicHeadersPath,
			packageAccess: cxxboost_xpressive.packageAccess
		),
		.target(
			name: cxxboost_config.name,
			dependencies: cxxboost_config.dependencies,
			path: cxxboost_config.path,
			exclude: cxxboost_config.exclude,
			sources: cxxboost_config.sources,
			publicHeadersPath: cxxboost_config.publicHeadersPath,
			packageAccess: cxxboost_config.packageAccess
		),
		.target(
			name: cxxboost_json.name,
			dependencies: cxxboost_json.dependencies,
			path: cxxboost_json.path,
			exclude: cxxboost_json.exclude,
			sources: cxxboost_json.sources,
			publicHeadersPath: cxxboost_json.publicHeadersPath,
			packageAccess: cxxboost_json.packageAccess
		),
		.target(
			name: cxxboost_ratio.name,
			dependencies: cxxboost_ratio.dependencies,
			path: cxxboost_ratio.path,
			exclude: cxxboost_ratio.exclude,
			sources: cxxboost_ratio.sources,
			publicHeadersPath: cxxboost_ratio.publicHeadersPath,
			packageAccess: cxxboost_ratio.packageAccess
		),
		.target(
			name: cxxboost_sort.name,
			dependencies: cxxboost_sort.dependencies,
			path: cxxboost_sort.path,
			exclude: cxxboost_sort.exclude,
			sources: cxxboost_sort.sources,
			publicHeadersPath: cxxboost_sort.publicHeadersPath,
			packageAccess: cxxboost_sort.packageAccess
		),
		.target(
			name: cxxboost_context.name,
			dependencies: cxxboost_context.dependencies,
			path: cxxboost_context.path,
			exclude: cxxboost_context.exclude,
			sources: cxxboost_context.sources,
			publicHeadersPath: cxxboost_context.publicHeadersPath,
			packageAccess: cxxboost_context.packageAccess
		),
		.target(
			name: cxxboost_endian.name,
			dependencies: cxxboost_endian.dependencies,
			path: cxxboost_endian.path,
			exclude: cxxboost_endian.exclude,
			sources: cxxboost_endian.sources,
			publicHeadersPath: cxxboost_endian.publicHeadersPath,
			packageAccess: cxxboost_endian.packageAccess
		),
		.target(
			name: cxxboost_coroutine2.name,
			dependencies: cxxboost_coroutine2.dependencies,
			path: cxxboost_coroutine2.path,
			exclude: cxxboost_coroutine2.exclude,
			sources: cxxboost_coroutine2.sources,
			publicHeadersPath: cxxboost_coroutine2.publicHeadersPath,
			packageAccess: cxxboost_coroutine2.packageAccess
		),
		.target(
			name: cxxboost_preprocessor.name,
			dependencies: cxxboost_preprocessor.dependencies,
			path: cxxboost_preprocessor.path,
			exclude: cxxboost_preprocessor.exclude,
			sources: cxxboost_preprocessor.sources,
			publicHeadersPath: cxxboost_preprocessor.publicHeadersPath,
			packageAccess: cxxboost_preprocessor.packageAccess
		),
		.target(
			name: cxxboost_align.name,
			dependencies: cxxboost_align.dependencies,
			path: cxxboost_align.path,
			exclude: cxxboost_align.exclude,
			sources: cxxboost_align.sources,
			publicHeadersPath: cxxboost_align.publicHeadersPath,
			packageAccess: cxxboost_align.packageAccess
		),
		.target(
			name: cxxboost_phoenix.name,
			dependencies: cxxboost_phoenix.dependencies,
			path: cxxboost_phoenix.path,
			exclude: cxxboost_phoenix.exclude,
			sources: cxxboost_phoenix.sources,
			publicHeadersPath: cxxboost_phoenix.publicHeadersPath,
			packageAccess: cxxboost_phoenix.packageAccess
		),
		.target(
			name: cxxboost_assign.name,
			dependencies: cxxboost_assign.dependencies,
			path: cxxboost_assign.path,
			exclude: cxxboost_assign.exclude,
			sources: cxxboost_assign.sources,
			publicHeadersPath: cxxboost_assign.publicHeadersPath,
			packageAccess: cxxboost_assign.packageAccess
		),
		.target(
			name: cxxboost_foreach.name,
			dependencies: cxxboost_foreach.dependencies,
			path: cxxboost_foreach.path,
			exclude: cxxboost_foreach.exclude,
			sources: cxxboost_foreach.sources,
			publicHeadersPath: cxxboost_foreach.publicHeadersPath,
			packageAccess: cxxboost_foreach.packageAccess
		),
		.target(
			name: cxxboost_geometry.name,
			dependencies: cxxboost_geometry.dependencies,
			path: cxxboost_geometry.path,
			exclude: cxxboost_geometry.exclude,
			sources: cxxboost_geometry.sources,
			publicHeadersPath: cxxboost_geometry.publicHeadersPath,
			packageAccess: cxxboost_geometry.packageAccess
		),
		.target(
			name: cxxboost_locale.name,
			dependencies: cxxboost_locale.dependencies,
			path: cxxboost_locale.path,
			exclude: cxxboost_locale.exclude,
			sources: cxxboost_locale.sources,
			publicHeadersPath: cxxboost_locale.publicHeadersPath,
			packageAccess: cxxboost_locale.packageAccess
		),
		.target(
			name: cxxboost_proto.name,
			dependencies: cxxboost_proto.dependencies,
			path: cxxboost_proto.path,
			exclude: cxxboost_proto.exclude,
			sources: cxxboost_proto.sources,
			publicHeadersPath: cxxboost_proto.publicHeadersPath,
			packageAccess: cxxboost_proto.packageAccess
		),
		.target(
			name: cxxboost_flyweight.name,
			dependencies: cxxboost_flyweight.dependencies,
			path: cxxboost_flyweight.path,
			exclude: cxxboost_flyweight.exclude,
			sources: cxxboost_flyweight.sources,
			publicHeadersPath: cxxboost_flyweight.publicHeadersPath,
			packageAccess: cxxboost_flyweight.packageAccess
		),
		.target(
			name: cxxboost_nowide.name,
			dependencies: cxxboost_nowide.dependencies,
			path: cxxboost_nowide.path,
			exclude: cxxboost_nowide.exclude,
			sources: cxxboost_nowide.sources,
			publicHeadersPath: cxxboost_nowide.publicHeadersPath,
			packageAccess: cxxboost_nowide.packageAccess
		),
		.target(
			name: cxxboost_msm.name,
			dependencies: cxxboost_msm.dependencies,
			path: cxxboost_msm.path,
			exclude: cxxboost_msm.exclude,
			sources: cxxboost_msm.sources,
			publicHeadersPath: cxxboost_msm.publicHeadersPath,
			packageAccess: cxxboost_msm.packageAccess
		),
		.target(
			name: cxxboost_mp11.name,
			dependencies: cxxboost_mp11.dependencies,
			path: cxxboost_mp11.path,
			exclude: cxxboost_mp11.exclude,
			sources: cxxboost_mp11.sources,
			publicHeadersPath: cxxboost_mp11.publicHeadersPath,
			packageAccess: cxxboost_mp11.packageAccess
		),
		.target(
			name: cxxboost_numeric-odeint.name,
			dependencies: cxxboost_numeric-odeint.dependencies,
			path: cxxboost_numeric-odeint.path,
			exclude: cxxboost_numeric-odeint.exclude,
			sources: cxxboost_numeric-odeint.sources,
			publicHeadersPath: cxxboost_numeric-odeint.publicHeadersPath,
			packageAccess: cxxboost_numeric-odeint.packageAccess
		),
		.target(
			name: cxxboost_format.name,
			dependencies: cxxboost_format.dependencies,
			path: cxxboost_format.path,
			exclude: cxxboost_format.exclude,
			sources: cxxboost_format.sources,
			publicHeadersPath: cxxboost_format.publicHeadersPath,
			packageAccess: cxxboost_format.packageAccess
		),
		.target(
			name: cxxboost_function.name,
			dependencies: cxxboost_function.dependencies,
			path: cxxboost_function.path,
			exclude: cxxboost_function.exclude,
			sources: cxxboost_function.sources,
			publicHeadersPath: cxxboost_function.publicHeadersPath,
			packageAccess: cxxboost_function.packageAccess
		),
		.target(
			name: cxxboost_type_index.name,
			dependencies: cxxboost_type_index.dependencies,
			path: cxxboost_type_index.path,
			exclude: cxxboost_type_index.exclude,
			sources: cxxboost_type_index.sources,
			publicHeadersPath: cxxboost_type_index.publicHeadersPath,
			packageAccess: cxxboost_type_index.packageAccess
		),
		.target(
			name: cxxboost_ptr_container.name,
			dependencies: cxxboost_ptr_container.dependencies,
			path: cxxboost_ptr_container.path,
			exclude: cxxboost_ptr_container.exclude,
			sources: cxxboost_ptr_container.sources,
			publicHeadersPath: cxxboost_ptr_container.publicHeadersPath,
			packageAccess: cxxboost_ptr_container.packageAccess
		),
		.target(
			name: cxxboost_property_map_parallel.name,
			dependencies: cxxboost_property_map_parallel.dependencies,
			path: cxxboost_property_map_parallel.path,
			exclude: cxxboost_property_map_parallel.exclude,
			sources: cxxboost_property_map_parallel.sources,
			publicHeadersPath: cxxboost_property_map_parallel.publicHeadersPath,
			packageAccess: cxxboost_property_map_parallel.packageAccess
		),
		.target(
			name: cxxboost_numeric-ublas.name,
			dependencies: cxxboost_numeric-ublas.dependencies,
			path: cxxboost_numeric-ublas.path,
			exclude: cxxboost_numeric-ublas.exclude,
			sources: cxxboost_numeric-ublas.sources,
			publicHeadersPath: cxxboost_numeric-ublas.publicHeadersPath,
			packageAccess: cxxboost_numeric-ublas.packageAccess
		),
		.target(
			name: cxxboost_container_hash.name,
			dependencies: cxxboost_container_hash.dependencies,
			path: cxxboost_container_hash.path,
			exclude: cxxboost_container_hash.exclude,
			sources: cxxboost_container_hash.sources,
			publicHeadersPath: cxxboost_container_hash.publicHeadersPath,
			packageAccess: cxxboost_container_hash.packageAccess
		),
		.target(
			name: cxxboost_outcome.name,
			dependencies: cxxboost_outcome.dependencies,
			path: cxxboost_outcome.path,
			exclude: cxxboost_outcome.exclude,
			sources: cxxboost_outcome.sources,
			publicHeadersPath: cxxboost_outcome.publicHeadersPath,
			packageAccess: cxxboost_outcome.packageAccess
		),
		.target(
			name: cxxboost_histogram.name,
			dependencies: cxxboost_histogram.dependencies,
			path: cxxboost_histogram.path,
			exclude: cxxboost_histogram.exclude,
			sources: cxxboost_histogram.sources,
			publicHeadersPath: cxxboost_histogram.publicHeadersPath,
			packageAccess: cxxboost_histogram.packageAccess
		),
		.target(
			name: cxxboost_lockfree.name,
			dependencies: cxxboost_lockfree.dependencies,
			path: cxxboost_lockfree.path,
			exclude: cxxboost_lockfree.exclude,
			sources: cxxboost_lockfree.sources,
			publicHeadersPath: cxxboost_lockfree.publicHeadersPath,
			packageAccess: cxxboost_lockfree.packageAccess
		),
		.target(
			name: cxxboost_parameter_python.name,
			dependencies: cxxboost_parameter_python.dependencies,
			path: cxxboost_parameter_python.path,
			exclude: cxxboost_parameter_python.exclude,
			sources: cxxboost_parameter_python.sources,
			publicHeadersPath: cxxboost_parameter_python.publicHeadersPath,
			packageAccess: cxxboost_parameter_python.packageAccess
		),
		.target(
			name: cxxboost_multiprecision.name,
			dependencies: cxxboost_multiprecision.dependencies,
			path: cxxboost_multiprecision.path,
			exclude: cxxboost_multiprecision.exclude,
			sources: cxxboost_multiprecision.sources,
			publicHeadersPath: cxxboost_multiprecision.publicHeadersPath,
			packageAccess: cxxboost_multiprecision.packageAccess
		),
		.target(
			name: cxxboost_lambda.name,
			dependencies: cxxboost_lambda.dependencies,
			path: cxxboost_lambda.path,
			exclude: cxxboost_lambda.exclude,
			sources: cxxboost_lambda.sources,
			publicHeadersPath: cxxboost_lambda.publicHeadersPath,
			packageAccess: cxxboost_lambda.packageAccess
		),
		.target(
			name: cxxboost_multi_index.name,
			dependencies: cxxboost_multi_index.dependencies,
			path: cxxboost_multi_index.path,
			exclude: cxxboost_multi_index.exclude,
			sources: cxxboost_multi_index.sources,
			publicHeadersPath: cxxboost_multi_index.publicHeadersPath,
			packageAccess: cxxboost_multi_index.packageAccess
		),
		.target(
			name: cxxboost_throw_exception.name,
			dependencies: cxxboost_throw_exception.dependencies,
			path: cxxboost_throw_exception.path,
			exclude: cxxboost_throw_exception.exclude,
			sources: cxxboost_throw_exception.sources,
			publicHeadersPath: cxxboost_throw_exception.publicHeadersPath,
			packageAccess: cxxboost_throw_exception.packageAccess
		),
		.target(
			name: cxxboost_log.name,
			dependencies: cxxboost_log.dependencies,
			path: cxxboost_log.path,
			exclude: cxxboost_log.exclude,
			sources: cxxboost_log.sources,
			publicHeadersPath: cxxboost_log.publicHeadersPath,
			packageAccess: cxxboost_log.packageAccess
		),
		.target(
			name: cxxboost_thread.name,
			dependencies: cxxboost_thread.dependencies,
			path: cxxboost_thread.path,
			exclude: cxxboost_thread.exclude,
			sources: cxxboost_thread.sources,
			publicHeadersPath: cxxboost_thread.publicHeadersPath,
			packageAccess: cxxboost_thread.packageAccess
		),
		.target(
			name: cxxboost_pfr.name,
			dependencies: cxxboost_pfr.dependencies,
			path: cxxboost_pfr.path,
			exclude: cxxboost_pfr.exclude,
			sources: cxxboost_pfr.sources,
			publicHeadersPath: cxxboost_pfr.publicHeadersPath,
			packageAccess: cxxboost_pfr.packageAccess
		),
		.target(
			name: cxxboost_callable_traits.name,
			dependencies: cxxboost_callable_traits.dependencies,
			path: cxxboost_callable_traits.path,
			exclude: cxxboost_callable_traits.exclude,
			sources: cxxboost_callable_traits.sources,
			publicHeadersPath: cxxboost_callable_traits.publicHeadersPath,
			packageAccess: cxxboost_callable_traits.packageAccess
		),
		.target(
			name: cxxboost_convert.name,
			dependencies: cxxboost_convert.dependencies,
			path: cxxboost_convert.path,
			exclude: cxxboost_convert.exclude,
			sources: cxxboost_convert.sources,
			publicHeadersPath: cxxboost_convert.publicHeadersPath,
			packageAccess: cxxboost_convert.packageAccess
		),
		.target(
			name: cxxboost_beast.name,
			dependencies: cxxboost_beast.dependencies,
			path: cxxboost_beast.path,
			exclude: cxxboost_beast.exclude,
			sources: cxxboost_beast.sources,
			publicHeadersPath: cxxboost_beast.publicHeadersPath,
			packageAccess: cxxboost_beast.packageAccess
		),
		.target(
			name: cxxboost_stl_interfaces.name,
			dependencies: cxxboost_stl_interfaces.dependencies,
			path: cxxboost_stl_interfaces.path,
			exclude: cxxboost_stl_interfaces.exclude,
			sources: cxxboost_stl_interfaces.sources,
			publicHeadersPath: cxxboost_stl_interfaces.publicHeadersPath,
			packageAccess: cxxboost_stl_interfaces.packageAccess
		),
		.target(
			name: cxxboost_compatibility.name,
			dependencies: cxxboost_compatibility.dependencies,
			path: cxxboost_compatibility.path,
			exclude: cxxboost_compatibility.exclude,
			sources: cxxboost_compatibility.sources,
			publicHeadersPath: cxxboost_compatibility.publicHeadersPath,
			packageAccess: cxxboost_compatibility.packageAccess
		),
		.target(
			name: cxxboost_optional.name,
			dependencies: cxxboost_optional.dependencies,
			path: cxxboost_optional.path,
			exclude: cxxboost_optional.exclude,
			sources: cxxboost_optional.sources,
			publicHeadersPath: cxxboost_optional.publicHeadersPath,
			packageAccess: cxxboost_optional.packageAccess
		),
		.target(
			name: cxxboost_range.name,
			dependencies: cxxboost_range.dependencies,
			path: cxxboost_range.path,
			exclude: cxxboost_range.exclude,
			sources: cxxboost_range.sources,
			publicHeadersPath: cxxboost_range.publicHeadersPath,
			packageAccess: cxxboost_range.packageAccess
		),
		.target(
			name: cxxboost_python.name,
			dependencies: cxxboost_python.dependencies,
			path: cxxboost_python.path,
			exclude: cxxboost_python.exclude,
			sources: cxxboost_python.sources,
			publicHeadersPath: cxxboost_python.publicHeadersPath,
			packageAccess: cxxboost_python.packageAccess
		),
		.target(
			name: cxxboost_date_time.name,
			dependencies: cxxboost_date_time.dependencies,
			path: cxxboost_date_time.path,
			exclude: cxxboost_date_time.exclude,
			sources: cxxboost_date_time.sources,
			publicHeadersPath: cxxboost_date_time.publicHeadersPath,
			packageAccess: cxxboost_date_time.packageAccess
		),
		.target(
			name: cxxboost_hana.name,
			dependencies: cxxboost_hana.dependencies,
			path: cxxboost_hana.path,
			exclude: cxxboost_hana.exclude,
			sources: cxxboost_hana.sources,
			publicHeadersPath: cxxboost_hana.publicHeadersPath,
			packageAccess: cxxboost_hana.packageAccess
		),
		.target(
			name: cxxboost_multi_array.name,
			dependencies: cxxboost_multi_array.dependencies,
			path: cxxboost_multi_array.path,
			exclude: cxxboost_multi_array.exclude,
			sources: cxxboost_multi_array.sources,
			publicHeadersPath: cxxboost_multi_array.publicHeadersPath,
			packageAccess: cxxboost_multi_array.packageAccess
		),
		.target(
			name: cxxboost_asio.name,
			dependencies: cxxboost_asio.dependencies,
			path: cxxboost_asio.path,
			exclude: cxxboost_asio.exclude,
			sources: cxxboost_asio.sources,
			publicHeadersPath: cxxboost_asio.publicHeadersPath,
			packageAccess: cxxboost_asio.packageAccess
		),
		.target(
			name: cxxboost_atomic.name,
			dependencies: cxxboost_atomic.dependencies,
			path: cxxboost_atomic.path,
			exclude: cxxboost_atomic.exclude,
			sources: cxxboost_atomic.sources,
			publicHeadersPath: cxxboost_atomic.publicHeadersPath,
			packageAccess: cxxboost_atomic.packageAccess
		),
		.target(
			name: cxxboost_gil.name,
			dependencies: cxxboost_gil.dependencies,
			path: cxxboost_gil.path,
			exclude: cxxboost_gil.exclude,
			sources: cxxboost_gil.sources,
			publicHeadersPath: cxxboost_gil.publicHeadersPath,
			packageAccess: cxxboost_gil.packageAccess
		),
		.target(
			name: cxxboost_logic.name,
			dependencies: cxxboost_logic.dependencies,
			path: cxxboost_logic.path,
			exclude: cxxboost_logic.exclude,
			sources: cxxboost_logic.sources,
			publicHeadersPath: cxxboost_logic.publicHeadersPath,
			packageAccess: cxxboost_logic.packageAccess
		),
		.target(
			name: cxxboost_variant.name,
			dependencies: cxxboost_variant.dependencies,
			path: cxxboost_variant.path,
			exclude: cxxboost_variant.exclude,
			sources: cxxboost_variant.sources,
			publicHeadersPath: cxxboost_variant.publicHeadersPath,
			packageAccess: cxxboost_variant.packageAccess
		),
		.target(
			name: cxxboost_fiber.name,
			dependencies: cxxboost_fiber.dependencies,
			path: cxxboost_fiber.path,
			exclude: cxxboost_fiber.exclude,
			sources: cxxboost_fiber.sources,
			publicHeadersPath: cxxboost_fiber.publicHeadersPath,
			packageAccess: cxxboost_fiber.packageAccess
		),
		.target(
			name: cxxboost_container.name,
			dependencies: cxxboost_container.dependencies,
			path: cxxboost_container.path,
			exclude: cxxboost_container.exclude,
			sources: cxxboost_container.sources,
			publicHeadersPath: cxxboost_container.publicHeadersPath,
			packageAccess: cxxboost_container.packageAccess
		),
		.target(
			name: cxxboost_fusion.name,
			dependencies: cxxboost_fusion.dependencies,
			path: cxxboost_fusion.path,
			exclude: cxxboost_fusion.exclude,
			sources: cxxboost_fusion.sources,
			publicHeadersPath: cxxboost_fusion.publicHeadersPath,
			packageAccess: cxxboost_fusion.packageAccess
		),
		.target(
			name: cxxboost_math.name,
			dependencies: cxxboost_math.dependencies,
			path: cxxboost_math.path,
			exclude: cxxboost_math.exclude,
			sources: cxxboost_math.sources,
			publicHeadersPath: cxxboost_math.publicHeadersPath,
			packageAccess: cxxboost_math.packageAccess
		),
		.target(
			name: cxxboost_property_map.name,
			dependencies: cxxboost_property_map.dependencies,
			path: cxxboost_property_map.path,
			exclude: cxxboost_property_map.exclude,
			sources: cxxboost_property_map.sources,
			publicHeadersPath: cxxboost_property_map.publicHeadersPath,
			packageAccess: cxxboost_property_map.packageAccess
		),
		.target(
			name: cxxboost_leaf.name,
			dependencies: cxxboost_leaf.dependencies,
			path: cxxboost_leaf.path,
			exclude: cxxboost_leaf.exclude,
			sources: cxxboost_leaf.sources,
			publicHeadersPath: cxxboost_leaf.publicHeadersPath,
			packageAccess: cxxboost_leaf.packageAccess
		),
		.target(
			name: cxxboost_winapi.name,
			dependencies: cxxboost_winapi.dependencies,
			path: cxxboost_winapi.path,
			exclude: cxxboost_winapi.exclude,
			sources: cxxboost_winapi.sources,
			publicHeadersPath: cxxboost_winapi.publicHeadersPath,
			packageAccess: cxxboost_winapi.packageAccess
		),
		.target(
			name: cxxboost_dynamic_bitset.name,
			dependencies: cxxboost_dynamic_bitset.dependencies,
			path: cxxboost_dynamic_bitset.path,
			exclude: cxxboost_dynamic_bitset.exclude,
			sources: cxxboost_dynamic_bitset.sources,
			publicHeadersPath: cxxboost_dynamic_bitset.publicHeadersPath,
			packageAccess: cxxboost_dynamic_bitset.packageAccess
		),
		.target(
			name: cxxboost_yap.name,
			dependencies: cxxboost_yap.dependencies,
			path: cxxboost_yap.path,
			exclude: cxxboost_yap.exclude,
			sources: cxxboost_yap.sources,
			publicHeadersPath: cxxboost_yap.publicHeadersPath,
			packageAccess: cxxboost_yap.packageAccess
		),
		.target(
			name: cxxboost_signals2.name,
			dependencies: cxxboost_signals2.dependencies,
			path: cxxboost_signals2.path,
			exclude: cxxboost_signals2.exclude,
			sources: cxxboost_signals2.sources,
			publicHeadersPath: cxxboost_signals2.publicHeadersPath,
			packageAccess: cxxboost_signals2.packageAccess
		),
		.target(
			name: cxxboost_accumulators.name,
			dependencies: cxxboost_accumulators.dependencies,
			path: cxxboost_accumulators.path,
			exclude: cxxboost_accumulators.exclude,
			sources: cxxboost_accumulators.sources,
			publicHeadersPath: cxxboost_accumulators.publicHeadersPath,
			packageAccess: cxxboost_accumulators.packageAccess
		),
		.target(
			name: cxxboost_unordered.name,
			dependencies: cxxboost_unordered.dependencies,
			path: cxxboost_unordered.path,
			exclude: cxxboost_unordered.exclude,
			sources: cxxboost_unordered.sources,
			publicHeadersPath: cxxboost_unordered.publicHeadersPath,
			packageAccess: cxxboost_unordered.packageAccess
		),
		.target(
			name: cxxboost_io.name,
			dependencies: cxxboost_io.dependencies,
			path: cxxboost_io.path,
			exclude: cxxboost_io.exclude,
			sources: cxxboost_io.sources,
			publicHeadersPath: cxxboost_io.publicHeadersPath,
			packageAccess: cxxboost_io.packageAccess
		),
		.target(
			name: cxxboost_iterator.name,
			dependencies: cxxboost_iterator.dependencies,
			path: cxxboost_iterator.path,
			exclude: cxxboost_iterator.exclude,
			sources: cxxboost_iterator.sources,
			publicHeadersPath: cxxboost_iterator.publicHeadersPath,
			packageAccess: cxxboost_iterator.packageAccess
		),
		.target(
			name: cxxboost_function_types.name,
			dependencies: cxxboost_function_types.dependencies,
			path: cxxboost_function_types.path,
			exclude: cxxboost_function_types.exclude,
			sources: cxxboost_function_types.sources,
			publicHeadersPath: cxxboost_function_types.publicHeadersPath,
			packageAccess: cxxboost_function_types.packageAccess
		),
		.target(
			name: cxxboost_process.name,
			dependencies: cxxboost_process.dependencies,
			path: cxxboost_process.path,
			exclude: cxxboost_process.exclude,
			sources: cxxboost_process.sources,
			publicHeadersPath: cxxboost_process.publicHeadersPath,
			packageAccess: cxxboost_process.packageAccess
		),
		.target(
			name: cxxboost_headers.name,
			dependencies: cxxboost_headers.dependencies,
			path: cxxboost_headers.path,
			exclude: cxxboost_headers.exclude,
			sources: cxxboost_headers.sources,
			publicHeadersPath: cxxboost_headers.publicHeadersPath,
			packageAccess: cxxboost_headers.packageAccess
		),
		.target(
			name: cxxboost_heap.name,
			dependencies: cxxboost_heap.dependencies,
			path: cxxboost_heap.path,
			exclude: cxxboost_heap.exclude,
			sources: cxxboost_heap.sources,
			publicHeadersPath: cxxboost_heap.publicHeadersPath,
			packageAccess: cxxboost_heap.packageAccess
		),
		.target(
			name: cxxboost_bimap.name,
			dependencies: cxxboost_bimap.dependencies,
			path: cxxboost_bimap.path,
			exclude: cxxboost_bimap.exclude,
			sources: cxxboost_bimap.sources,
			publicHeadersPath: cxxboost_bimap.publicHeadersPath,
			packageAccess: cxxboost_bimap.packageAccess
		),
		.target(
			name: cxxboost_pool.name,
			dependencies: cxxboost_pool.dependencies,
			path: cxxboost_pool.path,
			exclude: cxxboost_pool.exclude,
			sources: cxxboost_pool.sources,
			publicHeadersPath: cxxboost_pool.publicHeadersPath,
			packageAccess: cxxboost_pool.packageAccess
		),
		.target(
			name: cxxboost_utility.name,
			dependencies: cxxboost_utility.dependencies,
			path: cxxboost_utility.path,
			exclude: cxxboost_utility.exclude,
			sources: cxxboost_utility.sources,
			publicHeadersPath: cxxboost_utility.publicHeadersPath,
			packageAccess: cxxboost_utility.packageAccess
		),
		.target(
			name: cxxboost_bind.name,
			dependencies: cxxboost_bind.dependencies,
			path: cxxboost_bind.path,
			exclude: cxxboost_bind.exclude,
			sources: cxxboost_bind.sources,
			publicHeadersPath: cxxboost_bind.publicHeadersPath,
			packageAccess: cxxboost_bind.packageAccess
		),
		.target(
			name: cxxboost_describe.name,
			dependencies: cxxboost_describe.dependencies,
			path: cxxboost_describe.path,
			exclude: cxxboost_describe.exclude,
			sources: cxxboost_describe.sources,
			publicHeadersPath: cxxboost_describe.publicHeadersPath,
			packageAccess: cxxboost_describe.packageAccess
		),
		.target(
			name: cxxboost_array.name,
			dependencies: cxxboost_array.dependencies,
			path: cxxboost_array.path,
			exclude: cxxboost_array.exclude,
			sources: cxxboost_array.sources,
			publicHeadersPath: cxxboost_array.publicHeadersPath,
			packageAccess: cxxboost_array.packageAccess
		),
		.target(
			name: cxxboost_graph.name,
			dependencies: cxxboost_graph.dependencies,
			path: cxxboost_graph.path,
			exclude: cxxboost_graph.exclude,
			sources: cxxboost_graph.sources,
			publicHeadersPath: cxxboost_graph.publicHeadersPath,
			packageAccess: cxxboost_graph.packageAccess
		),
		.target(
			name: cxxboost_hof.name,
			dependencies: cxxboost_hof.dependencies,
			path: cxxboost_hof.path,
			exclude: cxxboost_hof.exclude,
			sources: cxxboost_hof.sources,
			publicHeadersPath: cxxboost_hof.publicHeadersPath,
			packageAccess: cxxboost_hof.packageAccess
		),
		.target(
			name: cxxboost_spirit.name,
			dependencies: cxxboost_spirit.dependencies,
			path: cxxboost_spirit.path,
			exclude: cxxboost_spirit.exclude,
			sources: cxxboost_spirit.sources,
			publicHeadersPath: cxxboost_spirit.publicHeadersPath,
			packageAccess: cxxboost_spirit.packageAccess
		),
		.target(
			name: cxxboost_iostreams.name,
			dependencies: cxxboost_iostreams.dependencies,
			path: cxxboost_iostreams.path,
			exclude: cxxboost_iostreams.exclude,
			sources: cxxboost_iostreams.sources,
			publicHeadersPath: cxxboost_iostreams.publicHeadersPath,
			packageAccess: cxxboost_iostreams.packageAccess
		),
		.target(
			name: cxxboost_rational.name,
			dependencies: cxxboost_rational.dependencies,
			path: cxxboost_rational.path,
			exclude: cxxboost_rational.exclude,
			sources: cxxboost_rational.sources,
			publicHeadersPath: cxxboost_rational.publicHeadersPath,
			packageAccess: cxxboost_rational.packageAccess
		),
		.target(
			name: cxxboost_crc.name,
			dependencies: cxxboost_crc.dependencies,
			path: cxxboost_crc.path,
			exclude: cxxboost_crc.exclude,
			sources: cxxboost_crc.sources,
			publicHeadersPath: cxxboost_crc.publicHeadersPath,
			packageAccess: cxxboost_crc.packageAccess
		),
		.target(
			name: cxxboost_any.name,
			dependencies: cxxboost_any.dependencies,
			path: cxxboost_any.path,
			exclude: cxxboost_any.exclude,
			sources: cxxboost_any.sources,
			publicHeadersPath: cxxboost_any.publicHeadersPath,
			packageAccess: cxxboost_any.packageAccess
		),
		.target(
			name: cxxboost_poly_collection.name,
			dependencies: cxxboost_poly_collection.dependencies,
			path: cxxboost_poly_collection.path,
			exclude: cxxboost_poly_collection.exclude,
			sources: cxxboost_poly_collection.sources,
			publicHeadersPath: cxxboost_poly_collection.publicHeadersPath,
			packageAccess: cxxboost_poly_collection.packageAccess
		),
		.target(
			name: cxxboost_circular_buffer.name,
			dependencies: cxxboost_circular_buffer.dependencies,
			path: cxxboost_circular_buffer.path,
			exclude: cxxboost_circular_buffer.exclude,
			sources: cxxboost_circular_buffer.sources,
			publicHeadersPath: cxxboost_circular_buffer.publicHeadersPath,
			packageAccess: cxxboost_circular_buffer.packageAccess
		),
		.target(
			name: cxxboost_parameter.name,
			dependencies: cxxboost_parameter.dependencies,
			path: cxxboost_parameter.path,
			exclude: cxxboost_parameter.exclude,
			sources: cxxboost_parameter.sources,
			publicHeadersPath: cxxboost_parameter.publicHeadersPath,
			packageAccess: cxxboost_parameter.packageAccess
		),
		.target(
			name: cxxboost_concept_check.name,
			dependencies: cxxboost_concept_check.dependencies,
			path: cxxboost_concept_check.path,
			exclude: cxxboost_concept_check.exclude,
			sources: cxxboost_concept_check.sources,
			publicHeadersPath: cxxboost_concept_check.publicHeadersPath,
			packageAccess: cxxboost_concept_check.packageAccess
		),
		.target(
			name: cxxboost_stacktrace.name,
			dependencies: cxxboost_stacktrace.dependencies,
			path: cxxboost_stacktrace.path,
			exclude: cxxboost_stacktrace.exclude,
			sources: cxxboost_stacktrace.sources,
			publicHeadersPath: cxxboost_stacktrace.publicHeadersPath,
			packageAccess: cxxboost_stacktrace.packageAccess
		),
		.target(
			name: cxxboost_mpl.name,
			dependencies: cxxboost_mpl.dependencies,
			path: cxxboost_mpl.path,
			exclude: cxxboost_mpl.exclude,
			sources: cxxboost_mpl.sources,
			publicHeadersPath: cxxboost_mpl.publicHeadersPath,
			packageAccess: cxxboost_mpl.packageAccess
		),
		.target(
			name: cxxboost_mysql.name,
			dependencies: cxxboost_mysql.dependencies,
			path: cxxboost_mysql.path,
			exclude: cxxboost_mysql.exclude,
			sources: cxxboost_mysql.sources,
			publicHeadersPath: cxxboost_mysql.publicHeadersPath,
			packageAccess: cxxboost_mysql.packageAccess
		),
		.target(
			name: cxxboost_system.name,
			dependencies: cxxboost_system.dependencies,
			path: cxxboost_system.path,
			exclude: cxxboost_system.exclude,
			sources: cxxboost_system.sources,
			publicHeadersPath: cxxboost_system.publicHeadersPath,
			packageAccess: cxxboost_system.packageAccess
		),
		.target(
			name: cxxboost_property_tree.name,
			dependencies: cxxboost_property_tree.dependencies,
			path: cxxboost_property_tree.path,
			exclude: cxxboost_property_tree.exclude,
			sources: cxxboost_property_tree.sources,
			publicHeadersPath: cxxboost_property_tree.publicHeadersPath,
			packageAccess: cxxboost_property_tree.packageAccess
		),
		.target(
			name: cxxboost_scope_exit.name,
			dependencies: cxxboost_scope_exit.dependencies,
			path: cxxboost_scope_exit.path,
			exclude: cxxboost_scope_exit.exclude,
			sources: cxxboost_scope_exit.sources,
			publicHeadersPath: cxxboost_scope_exit.publicHeadersPath,
			packageAccess: cxxboost_scope_exit.packageAccess
		),
		.target(
			name: cxxboost_units.name,
			dependencies: cxxboost_units.dependencies,
			path: cxxboost_units.path,
			exclude: cxxboost_units.exclude,
			sources: cxxboost_units.sources,
			publicHeadersPath: cxxboost_units.publicHeadersPath,
			packageAccess: cxxboost_units.packageAccess
		),
		.target(
			name: cxxboost_coroutine.name,
			dependencies: cxxboost_coroutine.dependencies,
			path: cxxboost_coroutine.path,
			exclude: cxxboost_coroutine.exclude,
			sources: cxxboost_coroutine.sources,
			publicHeadersPath: cxxboost_coroutine.publicHeadersPath,
			packageAccess: cxxboost_coroutine.packageAccess
		),
		.target(
			name: cxxboost_numeric-conversion.name,
			dependencies: cxxboost_numeric-conversion.dependencies,
			path: cxxboost_numeric-conversion.path,
			exclude: cxxboost_numeric-conversion.exclude,
			sources: cxxboost_numeric-conversion.sources,
			publicHeadersPath: cxxboost_numeric-conversion.publicHeadersPath,
			packageAccess: cxxboost_numeric-conversion.packageAccess
		),
		.target(
			name: cxxboost_interprocess.name,
			dependencies: cxxboost_interprocess.dependencies,
			path: cxxboost_interprocess.path,
			exclude: cxxboost_interprocess.exclude,
			sources: cxxboost_interprocess.sources,
			publicHeadersPath: cxxboost_interprocess.publicHeadersPath,
			packageAccess: cxxboost_interprocess.packageAccess
		),
		.target(
			name: cxxboost_typeof.name,
			dependencies: cxxboost_typeof.dependencies,
			path: cxxboost_typeof.path,
			exclude: cxxboost_typeof.exclude,
			sources: cxxboost_typeof.sources,
			publicHeadersPath: cxxboost_typeof.publicHeadersPath,
			packageAccess: cxxboost_typeof.packageAccess
		),
		.target(
			name: cxxboost_graph_parallel.name,
			dependencies: cxxboost_graph_parallel.dependencies,
			path: cxxboost_graph_parallel.path,
			exclude: cxxboost_graph_parallel.exclude,
			sources: cxxboost_graph_parallel.sources,
			publicHeadersPath: cxxboost_graph_parallel.publicHeadersPath,
			packageAccess: cxxboost_graph_parallel.packageAccess
		),
		.target(
			name: cxxboost_lexical_cast.name,
			dependencies: cxxboost_lexical_cast.dependencies,
			path: cxxboost_lexical_cast.path,
			exclude: cxxboost_lexical_cast.exclude,
			sources: cxxboost_lexical_cast.sources,
			publicHeadersPath: cxxboost_lexical_cast.publicHeadersPath,
			packageAccess: cxxboost_lexical_cast.packageAccess
		),
		.target(
			name: cxxboost_statechart.name,
			dependencies: cxxboost_statechart.dependencies,
			path: cxxboost_statechart.path,
			exclude: cxxboost_statechart.exclude,
			sources: cxxboost_statechart.sources,
			publicHeadersPath: cxxboost_statechart.publicHeadersPath,
			packageAccess: cxxboost_statechart.packageAccess
		),
		.target(
			name: cxxboost_numeric-interval.name,
			dependencies: cxxboost_numeric-interval.dependencies,
			path: cxxboost_numeric-interval.path,
			exclude: cxxboost_numeric-interval.exclude,
			sources: cxxboost_numeric-interval.sources,
			publicHeadersPath: cxxboost_numeric-interval.publicHeadersPath,
			packageAccess: cxxboost_numeric-interval.packageAccess
		),
		.target(
			name: cxxboost_url.name,
			dependencies: cxxboost_url.dependencies,
			path: cxxboost_url.path,
			exclude: cxxboost_url.exclude,
			sources: cxxboost_url.sources,
			publicHeadersPath: cxxboost_url.publicHeadersPath,
			packageAccess: cxxboost_url.packageAccess
		),
		.target(
			name: cxxboost_local_function.name,
			dependencies: cxxboost_local_function.dependencies,
			path: cxxboost_local_function.path,
			exclude: cxxboost_local_function.exclude,
			sources: cxxboost_local_function.sources,
			publicHeadersPath: cxxboost_local_function.publicHeadersPath,
			packageAccess: cxxboost_local_function.packageAccess
		),
		.target(
			name: cxxboost_algorithm.name,
			dependencies: cxxboost_algorithm.dependencies,
			path: cxxboost_algorithm.path,
			exclude: cxxboost_algorithm.exclude,
			sources: cxxboost_algorithm.sources,
			publicHeadersPath: cxxboost_algorithm.publicHeadersPath,
			packageAccess: cxxboost_algorithm.packageAccess
		),
		.target(
			name: cxxboost_regex.name,
			dependencies: cxxboost_regex.dependencies,
			path: cxxboost_regex.path,
			exclude: cxxboost_regex.exclude,
			sources: cxxboost_regex.sources,
			publicHeadersPath: cxxboost_regex.publicHeadersPath,
			packageAccess: cxxboost_regex.packageAccess
		),
		.target(
			name: cxxboost_polygon.name,
			dependencies: cxxboost_polygon.dependencies,
			path: cxxboost_polygon.path,
			exclude: cxxboost_polygon.exclude,
			sources: cxxboost_polygon.sources,
			publicHeadersPath: cxxboost_polygon.publicHeadersPath,
			packageAccess: cxxboost_polygon.packageAccess
		),
		.target(
			name: cxxboost_static_assert.name,
			dependencies: cxxboost_static_assert.dependencies,
			path: cxxboost_static_assert.path,
			exclude: cxxboost_static_assert.exclude,
			sources: cxxboost_static_assert.sources,
			publicHeadersPath: cxxboost_static_assert.publicHeadersPath,
			packageAccess: cxxboost_static_assert.packageAccess
		),
		.target(
			name: cxxboost_variant2.name,
			dependencies: cxxboost_variant2.dependencies,
			path: cxxboost_variant2.path,
			exclude: cxxboost_variant2.exclude,
			sources: cxxboost_variant2.sources,
			publicHeadersPath: cxxboost_variant2.publicHeadersPath,
			packageAccess: cxxboost_variant2.packageAccess
		),
		.target(
			name: cxxboost_test.name,
			dependencies: cxxboost_test.dependencies,
			path: cxxboost_test.path,
			exclude: cxxboost_test.exclude,
			sources: cxxboost_test.sources,
			publicHeadersPath: cxxboost_test.publicHeadersPath,
			packageAccess: cxxboost_test.packageAccess
		),
		.target(
			name: cxxboost_move.name,
			dependencies: cxxboost_move.dependencies,
			path: cxxboost_move.path,
			exclude: cxxboost_move.exclude,
			sources: cxxboost_move.sources,
			publicHeadersPath: cxxboost_move.publicHeadersPath,
			packageAccess: cxxboost_move.packageAccess
		),
		.target(
			name: cxxboost_type_erasure.name,
			dependencies: cxxboost_type_erasure.dependencies,
			path: cxxboost_type_erasure.path,
			exclude: cxxboost_type_erasure.exclude,
			sources: cxxboost_type_erasure.sources,
			publicHeadersPath: cxxboost_type_erasure.publicHeadersPath,
			packageAccess: cxxboost_type_erasure.packageAccess
		),
		.target(
			name: cxxboost_safe_numerics.name,
			dependencies: cxxboost_safe_numerics.dependencies,
			path: cxxboost_safe_numerics.path,
			exclude: cxxboost_safe_numerics.exclude,
			sources: cxxboost_safe_numerics.sources,
			publicHeadersPath: cxxboost_safe_numerics.publicHeadersPath,
			packageAccess: cxxboost_safe_numerics.packageAccess
		),
		.target(
			name: cxxboost_tuple.name,
			dependencies: cxxboost_tuple.dependencies,
			path: cxxboost_tuple.path,
			exclude: cxxboost_tuple.exclude,
			sources: cxxboost_tuple.sources,
			publicHeadersPath: cxxboost_tuple.publicHeadersPath,
			packageAccess: cxxboost_tuple.packageAccess
		),
		.target(
			name: cxxboost_serialization.name,
			dependencies: cxxboost_serialization.dependencies,
			path: cxxboost_serialization.path,
			exclude: cxxboost_serialization.exclude,
			sources: cxxboost_serialization.sources,
			publicHeadersPath: cxxboost_serialization.publicHeadersPath,
			packageAccess: cxxboost_serialization.packageAccess
		),
		.target(
			name: cxxboost_uuid.name,
			dependencies: cxxboost_uuid.dependencies,
			path: cxxboost_uuid.path,
			exclude: cxxboost_uuid.exclude,
			sources: cxxboost_uuid.sources,
			publicHeadersPath: cxxboost_uuid.publicHeadersPath,
			packageAccess: cxxboost_uuid.packageAccess
		),
		.target(
			name: cxxboost_core.name,
			dependencies: cxxboost_core.dependencies,
			path: cxxboost_core.path,
			exclude: cxxboost_core.exclude,
			sources: cxxboost_core.sources,
			publicHeadersPath: cxxboost_core.publicHeadersPath,
			packageAccess: cxxboost_core.packageAccess
		),
		.target(
			name: cxxboost_timer.name,
			dependencies: cxxboost_timer.dependencies,
			path: cxxboost_timer.path,
			exclude: cxxboost_timer.exclude,
			sources: cxxboost_timer.sources,
			publicHeadersPath: cxxboost_timer.publicHeadersPath,
			packageAccess: cxxboost_timer.packageAccess
		),
		.target(
			name: cxxboost_type_traits.name,
			dependencies: cxxboost_type_traits.dependencies,
			path: cxxboost_type_traits.path,
			exclude: cxxboost_type_traits.exclude,
			sources: cxxboost_type_traits.sources,
			publicHeadersPath: cxxboost_type_traits.publicHeadersPath,
			packageAccess: cxxboost_type_traits.packageAccess
		),
		.target(
			name: cxxboost_integer.name,
			dependencies: cxxboost_integer.dependencies,
			path: cxxboost_integer.path,
			exclude: cxxboost_integer.exclude,
			sources: cxxboost_integer.sources,
			publicHeadersPath: cxxboost_integer.publicHeadersPath,
			packageAccess: cxxboost_integer.packageAccess
		),
		.target(
			name: cxxboost_tti.name,
			dependencies: cxxboost_tti.dependencies,
			path: cxxboost_tti.path,
			exclude: cxxboost_tti.exclude,
			sources: cxxboost_tti.sources,
			publicHeadersPath: cxxboost_tti.publicHeadersPath,
			packageAccess: cxxboost_tti.packageAccess
		),
		.target(
			name: cxxboost_random.name,
			dependencies: cxxboost_random.dependencies,
			path: cxxboost_random.path,
			exclude: cxxboost_random.exclude,
			sources: cxxboost_random.sources,
			publicHeadersPath: cxxboost_random.publicHeadersPath,
			packageAccess: cxxboost_random.packageAccess
		),
		.target(
			name: cxxboost_lambda2.name,
			dependencies: cxxboost_lambda2.dependencies,
			path: cxxboost_lambda2.path,
			exclude: cxxboost_lambda2.exclude,
			sources: cxxboost_lambda2.sources,
			publicHeadersPath: cxxboost_lambda2.publicHeadersPath,
			packageAccess: cxxboost_lambda2.packageAccess
		),
		.target(
			name: cxxboost_detail.name,
			dependencies: cxxboost_detail.dependencies,
			path: cxxboost_detail.path,
			exclude: cxxboost_detail.exclude,
			sources: cxxboost_detail.sources,
			publicHeadersPath: cxxboost_detail.publicHeadersPath,
			packageAccess: cxxboost_detail.packageAccess
		)
	],
	cxxLanguageStandard: .cxx14
)


