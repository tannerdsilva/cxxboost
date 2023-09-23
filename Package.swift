// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "cxxboost",
    products: [
        .library(name:"_cxxboost_all", targets: ["boost_accumulators","boost_algorithm","boost_align","boost_any","boost_array","boost_asio","boost_assert","boost_assign","boost_atomic","boost_beast","boost_bimap","boost_bind","boost_callable_traits","boost_chrono","boost_circular_buffer","boost_compat","boost_compute","boost_concept_check","boost_config","boost_container","boost_container_hash","boost_context","boost_contract","boost_conversion","boost_convert","boost_core","boost_coroutine","boost_coroutine2","boost_crc","boost_date_time","boost_describe","boost_detail","boost_dll","boost_dynamic_bitset","boost_endian","boost_exception","boost_fiber","boost_filesystem","boost_flyweight","boost_foreach","boost_format","boost_function","boost_function_types","boost_functional","boost_fusion","boost_geometry","boost_gil","boost_graph","boost_graph_parallel","boost_hana","boost_heap","boost_histogram","boost_hof","boost_icl","boost_integer","boost_interprocess","boost_intrusive","boost_io","boost_iostreams","boost_iterator","boost_json","boost_lambda","boost_lambda2","boost_leaf","boost_lexical_cast","boost_local_function","boost_locale","boost_lockfree","boost_log","boost_logic","boost_math","boost_metaparse","boost_move","boost_mp11","boost_mpi","boost_mpl","boost_msm","boost_multi_array","boost_multi_index","boost_multiprecision","boost_mysql","boost_nowide","boost_numeric_conversion","boost_interval","boost_odeint","boost_ublas","boost_optional","boost_outcome","boost_parameter","boost_parameter_python","boost_pfr","boost_phoenix","boost_poly_collection","boost_polygon","boost_pool","boost_predef","boost_preprocessor","boost_process","boost_program_options","boost_property_map","boost_property_map_parallel","boost_property_tree","boost_proto","boost_ptr_container","boost_python","boost_qvm","boost_random","boost_range","boost_ratio","boost_rational","boost_regex","boost_safe_numerics","boost_scope_exit","boost_serialization","boost_signals2","boost_smart_ptr","boost_sort","boost_spirit","boost_stacktrace","boost_statechart","boost_static_assert","boost_static_string","boost_stl_interfaces","boost_system","boost_test","boost_thread","boost_throw_exception","boost_timer","boost_tokenizer","boost_tti","boost_tuple","boost_type_erasure","boost_type_index","boost_type_traits","boost_typeof","boost_units","boost_unordered","boost_url","boost_utility","boost_uuid","boost_variant","boost_variant2","boost_vmd","boost_wave","boost_winapi","boost_xpressive","boost_yap"]),
		.library(name:"cxxboost_accumulators", targets:["boost_accumulators"]),
		.library(name:"cxxboost_algorithm", targets:["boost_algorithm"]),
		.library(name:"cxxboost_align", targets:["boost_align"]),
		.library(name:"cxxboost_any", targets:["boost_any"]),
		.library(name:"cxxboost_array", targets:["boost_array"]),
		.library(name:"cxxboost_asio", targets:["boost_asio"]),
		.library(name:"cxxboost_assert", targets:["boost_assert"]),
		.library(name:"cxxboost_assign", targets:["boost_assign"]),
		.library(name:"cxxboost_atomic", targets:["boost_atomic"]),
		.library(name:"cxxboost_beast", targets:["boost_beast"]),
		.library(name:"cxxboost_bimap", targets:["boost_bimap"]),
		.library(name:"cxxboost_bind", targets:["boost_bind"]),
		.library(name:"cxxboost_callable_traits", targets:["boost_callable_traits"]),
		.library(name:"cxxboost_chrono", targets:["boost_chrono"]),
		.library(name:"cxxboost_circular_buffer", targets:["boost_circular_buffer"]),
		.library(name:"cxxboost_compat", targets:["boost_compat"]),
		.library(name:"cxxboost_compute", targets:["boost_compute"]),
		.library(name:"cxxboost_concept_check", targets:["boost_concept_check"]),
		.library(name:"cxxboost_config", targets:["boost_config"]),
		.library(name:"cxxboost_container", targets:["boost_container"]),
		.library(name:"cxxboost_container_hash", targets:["boost_container_hash"]),
		.library(name:"cxxboost_context", targets:["boost_context"]),
		.library(name:"cxxboost_contract", targets:["boost_contract"]),
		.library(name:"cxxboost_conversion", targets:["boost_conversion"]),
		.library(name:"cxxboost_convert", targets:["boost_convert"]),
		.library(name:"cxxboost_core", targets:["boost_core"]),
		.library(name:"cxxboost_coroutine", targets:["boost_coroutine"]),
		.library(name:"cxxboost_coroutine2", targets:["boost_coroutine2"]),
		.library(name:"cxxboost_crc", targets:["boost_crc"]),
		.library(name:"cxxboost_date_time", targets:["boost_date_time"]),
		.library(name:"cxxboost_describe", targets:["boost_describe"]),
		.library(name:"cxxboost_detail", targets:["boost_detail"]),
		.library(name:"cxxboost_dll", targets:["boost_dll"]),
		.library(name:"cxxboost_dynamic_bitset", targets:["boost_dynamic_bitset"]),
		.library(name:"cxxboost_endian", targets:["boost_endian"]),
		.library(name:"cxxboost_exception", targets:["boost_exception"]),
		.library(name:"cxxboost_fiber", targets:["boost_fiber"]),
		.library(name:"cxxboost_filesystem", targets:["boost_filesystem"]),
		.library(name:"cxxboost_flyweight", targets:["boost_flyweight"]),
		.library(name:"cxxboost_foreach", targets:["boost_foreach"]),
		.library(name:"cxxboost_format", targets:["boost_format"]),
		.library(name:"cxxboost_function", targets:["boost_function"]),
		.library(name:"cxxboost_function_types", targets:["boost_function_types"]),
		.library(name:"cxxboost_functional", targets:["boost_functional"]),
		.library(name:"cxxboost_fusion", targets:["boost_fusion"]),
		.library(name:"cxxboost_geometry", targets:["boost_geometry"]),
		.library(name:"cxxboost_gil", targets:["boost_gil"]),
		.library(name:"cxxboost_graph", targets:["boost_graph"]),
		.library(name:"cxxboost_graph_parallel", targets:["boost_graph_parallel"]),
		.library(name:"cxxboost_hana", targets:["boost_hana"]),
		.library(name:"cxxboost_heap", targets:["boost_heap"]),
		.library(name:"cxxboost_histogram", targets:["boost_histogram"]),
		.library(name:"cxxboost_hof", targets:["boost_hof"]),
		.library(name:"cxxboost_icl", targets:["boost_icl"]),
		.library(name:"cxxboost_integer", targets:["boost_integer"]),
		.library(name:"cxxboost_interprocess", targets:["boost_interprocess"]),
		.library(name:"cxxboost_intrusive", targets:["boost_intrusive"]),
		.library(name:"cxxboost_io", targets:["boost_io"]),
		.library(name:"cxxboost_iostreams", targets:["boost_iostreams"]),
		.library(name:"cxxboost_iterator", targets:["boost_iterator"]),
		.library(name:"cxxboost_json", targets:["boost_json"]),
		.library(name:"cxxboost_lambda", targets:["boost_lambda"]),
		.library(name:"cxxboost_lambda2", targets:["boost_lambda2"]),
		.library(name:"cxxboost_leaf", targets:["boost_leaf"]),
		.library(name:"cxxboost_lexical_cast", targets:["boost_lexical_cast"]),
		.library(name:"cxxboost_local_function", targets:["boost_local_function"]),
		.library(name:"cxxboost_locale", targets:["boost_locale"]),
		.library(name:"cxxboost_lockfree", targets:["boost_lockfree"]),
		.library(name:"cxxboost_log", targets:["boost_log"]),
		.library(name:"cxxboost_logic", targets:["boost_logic"]),
		.library(name:"cxxboost_math", targets:["boost_math"]),
		.library(name:"cxxboost_metaparse", targets:["boost_metaparse"]),
		.library(name:"cxxboost_move", targets:["boost_move"]),
		.library(name:"cxxboost_mp11", targets:["boost_mp11"]),
		.library(name:"cxxboost_mpi", targets:["boost_mpi"]),
		.library(name:"cxxboost_mpl", targets:["boost_mpl"]),
		.library(name:"cxxboost_msm", targets:["boost_msm"]),
		.library(name:"cxxboost_multi_array", targets:["boost_multi_array"]),
		.library(name:"cxxboost_multi_index", targets:["boost_multi_index"]),
		.library(name:"cxxboost_multiprecision", targets:["boost_multiprecision"]),
		.library(name:"cxxboost_mysql", targets:["boost_mysql"]),
		.library(name:"cxxboost_nowide", targets:["boost_nowide"]),
		.library(name:"cxxboost_numeric_conversion", targets:["boost_numeric_conversion"]),
		.library(name:"cxxboost_interval", targets:["boost_interval"]),
		.library(name:"cxxboost_odeint", targets:["boost_odeint"]),
		.library(name:"cxxboost_ublas", targets:["boost_ublas"]),
		.library(name:"cxxboost_optional", targets:["boost_optional"]),
		.library(name:"cxxboost_outcome", targets:["boost_outcome"]),
		.library(name:"cxxboost_parameter", targets:["boost_parameter"]),
		.library(name:"cxxboost_parameter_python", targets:["boost_parameter_python"]),
		.library(name:"cxxboost_pfr", targets:["boost_pfr"]),
		.library(name:"cxxboost_phoenix", targets:["boost_phoenix"]),
		.library(name:"cxxboost_poly_collection", targets:["boost_poly_collection"]),
		.library(name:"cxxboost_polygon", targets:["boost_polygon"]),
		.library(name:"cxxboost_pool", targets:["boost_pool"]),
		.library(name:"cxxboost_predef", targets:["boost_predef"]),
		.library(name:"cxxboost_preprocessor", targets:["boost_preprocessor"]),
		.library(name:"cxxboost_process", targets:["boost_process"]),
		.library(name:"cxxboost_program_options", targets:["boost_program_options"]),
		.library(name:"cxxboost_property_map", targets:["boost_property_map"]),
		.library(name:"cxxboost_property_map_parallel", targets:["boost_property_map_parallel"]),
		.library(name:"cxxboost_property_tree", targets:["boost_property_tree"]),
		.library(name:"cxxboost_proto", targets:["boost_proto"]),
		.library(name:"cxxboost_ptr_container", targets:["boost_ptr_container"]),
		.library(name:"cxxboost_python", targets:["boost_python"]),
		.library(name:"cxxboost_qvm", targets:["boost_qvm"]),
		.library(name:"cxxboost_random", targets:["boost_random"]),
		.library(name:"cxxboost_range", targets:["boost_range"]),
		.library(name:"cxxboost_ratio", targets:["boost_ratio"]),
		.library(name:"cxxboost_rational", targets:["boost_rational"]),
		.library(name:"cxxboost_regex", targets:["boost_regex"]),
		.library(name:"cxxboost_safe_numerics", targets:["boost_safe_numerics"]),
		.library(name:"cxxboost_scope_exit", targets:["boost_scope_exit"]),
		.library(name:"cxxboost_serialization", targets:["boost_serialization"]),
		.library(name:"cxxboost_signals2", targets:["boost_signals2"]),
		.library(name:"cxxboost_smart_ptr", targets:["boost_smart_ptr"]),
		.library(name:"cxxboost_sort", targets:["boost_sort"]),
		.library(name:"cxxboost_spirit", targets:["boost_spirit"]),
		.library(name:"cxxboost_stacktrace", targets:["boost_stacktrace"]),
		.library(name:"cxxboost_statechart", targets:["boost_statechart"]),
		.library(name:"cxxboost_static_assert", targets:["boost_static_assert"]),
		.library(name:"cxxboost_static_string", targets:["boost_static_string"]),
		.library(name:"cxxboost_stl_interfaces", targets:["boost_stl_interfaces"]),
		.library(name:"cxxboost_system", targets:["boost_system"]),
		.library(name:"cxxboost_test", targets:["boost_test"]),
		.library(name:"cxxboost_thread", targets:["boost_thread"]),
		.library(name:"cxxboost_throw_exception", targets:["boost_throw_exception"]),
		.library(name:"cxxboost_timer", targets:["boost_timer"]),
		.library(name:"cxxboost_tokenizer", targets:["boost_tokenizer"]),
		.library(name:"cxxboost_tti", targets:["boost_tti"]),
		.library(name:"cxxboost_tuple", targets:["boost_tuple"]),
		.library(name:"cxxboost_type_erasure", targets:["boost_type_erasure"]),
		.library(name:"cxxboost_type_index", targets:["boost_type_index"]),
		.library(name:"cxxboost_type_traits", targets:["boost_type_traits"]),
		.library(name:"cxxboost_typeof", targets:["boost_typeof"]),
		.library(name:"cxxboost_units", targets:["boost_units"]),
		.library(name:"cxxboost_unordered", targets:["boost_unordered"]),
		.library(name:"cxxboost_url", targets:["boost_url"]),
		.library(name:"cxxboost_utility", targets:["boost_utility"]),
		.library(name:"cxxboost_uuid", targets:["boost_uuid"]),
		.library(name:"cxxboost_variant", targets:["boost_variant"]),
		.library(name:"cxxboost_variant2", targets:["boost_variant2"]),
		.library(name:"cxxboost_vmd", targets:["boost_vmd"]),
		.library(name:"cxxboost_wave", targets:["boost_wave"]),
		.library(name:"cxxboost_winapi", targets:["boost_winapi"]),
		.library(name:"cxxboost_xpressive", targets:["boost_xpressive"]),
		.library(name:"cxxboost_yap", targets:["boost_yap"])
    ],
    targets: [
        .target(name:"boost_accumulators", path:"boost-libs/accumulators", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_algorithm", path:"boost-libs/algorithm", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_align", path:"boost-libs/align", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_any", path:"boost-libs/any", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_array", path:"boost-libs/array", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_asio", path:"boost-libs/asio", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_assert", path:"boost-libs/assert", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_assign", path:"boost-libs/assign", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_atomic", path:"boost-libs/atomic", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_beast", path:"boost-libs/beast", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_bimap", path:"boost-libs/bimap", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_bind", path:"boost-libs/bind", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_callable_traits", path:"boost-libs/callable_traits", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_chrono", path:"boost-libs/chrono", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_circular_buffer", path:"boost-libs/circular_buffer", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_compat", path:"boost-libs/compat", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_compute", path:"boost-libs/compute", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_concept_check", path:"boost-libs/concept_check", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_config", path:"boost-libs/config", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_container", path:"boost-libs/container", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_container_hash", path:"boost-libs/container_hash", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_context", path:"boost-libs/context", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_contract", path:"boost-libs/contract", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_conversion", path:"boost-libs/conversion", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_convert", path:"boost-libs/convert", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_core", path:"boost-libs/core", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_coroutine", path:"boost-libs/coroutine", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_coroutine2", path:"boost-libs/coroutine2", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_crc", path:"boost-libs/crc", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_date_time", dependencies:["boost_config", "boost_throw_exception", "boost_assert", "boost_type_traits", "boost_smart_ptr"], path:"boost-libs/date_time", exclude:[], sources:["src/posix_time"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_describe", path:"boost-libs/describe", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_detail", path:"boost-libs/detail", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_dll", path:"boost-libs/dll", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_dynamic_bitset", path:"boost-libs/dynamic_bitset", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_endian", path:"boost-libs/endian", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_exception", path:"boost-libs/exception", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_fiber", path:"boost-libs/fiber", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_filesystem", path:"boost-libs/filesystem", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_flyweight", path:"boost-libs/flyweight", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_foreach", path:"boost-libs/foreach", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_format", path:"boost-libs/format", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_function", path:"boost-libs/function", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_function_types", path:"boost-libs/function_types", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_functional", path:"boost-libs/functional", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_fusion", path:"boost-libs/fusion", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_geometry", path:"boost-libs/geometry", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_gil", path:"boost-libs/gil", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_graph", path:"boost-libs/graph", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_graph_parallel", path:"boost-libs/graph_parallel", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_hana", path:"boost-libs/hana", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_heap", path:"boost-libs/heap", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_histogram", path:"boost-libs/histogram", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_hof", path:"boost-libs/hof", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_icl", path:"boost-libs/icl", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_integer", path:"boost-libs/integer", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_interprocess", path:"boost-libs/interprocess", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_intrusive", path:"boost-libs/intrusive", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_io", path:"boost-libs/io", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_iostreams", path:"boost-libs/iostreams", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_iterator", path:"boost-libs/iterator", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_json", path:"boost-libs/json", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_lambda", path:"boost-libs/lambda", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_lambda2", path:"boost-libs/lambda2", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_leaf", path:"boost-libs/leaf", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_lexical_cast", path:"boost-libs/lexical_cast", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_local_function", path:"boost-libs/local_function", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_locale", path:"boost-libs/locale", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_lockfree", path:"boost-libs/lockfree", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_log", path:"boost-libs/log", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_logic", path:"boost-libs/logic", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_math", path:"boost-libs/math", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_metaparse", path:"boost-libs/metaparse", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_move", path:"boost-libs/move", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_mp11", path:"boost-libs/mp11", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_mpi", path:"boost-libs/mpi", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_mpl", path:"boost-libs/mpl", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_msm", path:"boost-libs/msm", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_multi_array", path:"boost-libs/multi_array", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_multi_index", path:"boost-libs/multi_index", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_multiprecision", path:"boost-libs/multiprecision", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_mysql", path:"boost-libs/mysql", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_nowide", path:"boost-libs/nowide", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_numeric_conversion", path:"boost-libs/numeric_conversion", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_interval", path:"boost-libs/interval", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_odeint", path:"boost-libs/odeint", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_ublas", path:"boost-libs/ublas", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_optional", path:"boost-libs/optional", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_outcome", path:"boost-libs/outcome", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_parameter", path:"boost-libs/parameter", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_parameter_python", path:"boost-libs/parameter_python", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_pfr", path:"boost-libs/pfr", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_phoenix", path:"boost-libs/phoenix", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_poly_collection", path:"boost-libs/poly_collection", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_polygon", path:"boost-libs/polygon", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_pool", path:"boost-libs/pool", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_predef", path:"boost-libs/predef", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_preprocessor", path:"boost-libs/preprocessor", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_process", path:"boost-libs/process", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_program_options", path:"boost-libs/program_options", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_property_map", path:"boost-libs/property_map", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_property_map_parallel", path:"boost-libs/property_map_parallel", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_property_tree", path:"boost-libs/property_tree", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_proto", path:"boost-libs/proto", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_ptr_container", path:"boost-libs/ptr_container", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_python", path:"boost-libs/python", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_qvm", path:"boost-libs/qvm", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_random", path:"boost-libs/random", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_range", path:"boost-libs/range", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_ratio", path:"boost-libs/ratio", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_rational", path:"boost-libs/rational", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_regex", path:"boost-libs/regex", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_safe_numerics", path:"boost-libs/safe_numerics", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_scope_exit", path:"boost-libs/scope_exit", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_serialization", dependencies:["boost_config", "boost_detail", "boost_assert", "boost_spirit", "boost_static_assert", "boost_smart_ptr", "boost_core", "boost_mpl", "boost_type_traits", "boost_preprocessor", "boost_io", "boost_integer", "boost_throw_exception", "boost_move", "boost_optional", "boost_function", "boost_iterator", "boost_array", "boost_bind", "boost_predef", "boost_utility"], path:"boost-libs/serialization", sources:["src"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_signals2", path:"boost-libs/signals2", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_smart_ptr", path:"boost-libs/smart_ptr", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_sort", path:"boost-libs/sort", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_spirit", path:"boost-libs/spirit", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_stacktrace", path:"boost-libs/stacktrace", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_statechart", path:"boost-libs/statechart", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_static_assert", path:"boost-libs/static_assert", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_static_string", path:"boost-libs/static_string", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_stl_interfaces", path:"boost-libs/stl_interfaces", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_system", dependencies:["boost_config", "boost_core", "boost_throw_exception", "boost_assert"], path:"boost-libs/system", exclude:[], sources:["src"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_test", dependencies:["boost_range", "boost_assert", "boost_function", "boost_detail", "boost_move", "boost_numeric_conversion", "boost_iterator", "boost_algorithm", "boost_exception", "boost_mpl", "boost_type_traits", "boost_preprocessor", "boost_bind", "boost_smart_ptr", "boost_throw_exception", "boost_static_assert", "boost_array", "boost_preprocessor", "boost_type_traits", "boost_config", "boost_io", "boost_utility", "boost_core"], path:"boost-libs/test", exclude:[], sources:["src"], publicHeadersPath:"include", packageAccess:true),
		// note: boost_thread has files excluded that are related to windows system code.
		.target(name:"boost_thread", dependencies:["boost_ratio", "boost_integer", "boost_io", "boost_container_hash", "boost_describe", "boost_mp11", "boost_tuple", "boost_exception", "boost_iterator", "boost_detail", "boost_optional", "boost_function", "boost_range", "boost_concept_check", "boost_lexical_cast", "boost_array", "boost_container", "boost_config", "boost_algorithm", "boost_predef", "boost_core", "boost_atomic", "boost_type_traits", "boost_static_assert", "boost_move", "boost_assert", "boost_throw_exception", "boost_bind", "boost_system", "boost_date_time", "boost_utility", "boost_numeric_conversion", "boost_mpl", "boost_preprocessor", "boost_chrono"], path:"boost-libs/thread", exclude:["src/win32"], sources:["src"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_throw_exception", path:"boost-libs/throw_exception", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_timer", dependencies:["boost_config", "boost_assert", "boost_io", "boost_predef"], path:"boost-libs/timer", sources:["src"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_tokenizer", path:"boost-libs/tokenizer", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_tti", path:"boost-libs/tti", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_tuple", path:"boost-libs/tuple", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_type_erasure", dependencies:["boost_mpl", "boost_preprocessor", "boost_type_traits", "boost_mp11", "boost_typeof", "boost_assert", "boost_static_assert", "boost_throw_exception", "boost_utility", "boost_thread", "boost_bind", "boost_move", "boost_date_time", "boost_numeric_conversion", "boost_chrono", "boost_predef", "boost_ratio", "boost_integer", "boost_config", "boost_core", "boost_system"], path:"boost-libs/type_erasure", sources:["src"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_type_index", path:"boost-libs/type_index", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_type_traits", path:"boost-libs/type_traits", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_typeof", path:"boost-libs/typeof", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_units", path:"boost-libs/units", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_unordered", path:"boost-libs/unordered", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_url", dependencies:["boost_core", "boost_utility", "boost_assert", "boost_config", "boost_system", "boost_variant2", "boost_mp11", "boost_throw_exception", "boost_static_assert", "boost_align", "boost_type_traits", "boost_optional", "boost_move"], path:"boost-libs/url", sources:["src"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_utility", path:"boost-libs/utility", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_uuid", path:"boost-libs/uuid", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_variant", path:"boost-libs/variant", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_variant2", path:"boost-libs/variant2", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_vmd", path:"boost-libs/vmd", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_wave", dependencies:["boost_config", "boost_core", "boost_iterator", "boost_static_assert", "boost_spirit", "boost_assert", "boost_throw_exception", "boost_mpl", "boost_preprocessor", "boost_type_traits", "boost_detail", "boost_pool", "boost_integer", "boost_smart_ptr", "boost_optional", "boost_move", "boost_utility", "boost_thread", "boost_system", "boost_concept_check", "boost_date_time", "boost_numeric_conversion", "boost_chrono", "boost_predef", "boost_ratio", "boost_bind", "boost_atomic", "boost_filesystem", "boost_io", "boost_container_hash"], path:"boost-libs/wave", sources:["src"], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_winapi", path:"boost-libs/winapi", exclude:["basic_types.hpp"], sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_xpressive", path:"boost-libs/xpressive", sources:[], publicHeadersPath:"include", packageAccess:true),
		.target(name:"boost_yap", path:"boost-libs/yap", sources:[], publicHeadersPath:"include", packageAccess:true)
    ],
    cxxLanguageStandard:.cxx14
)
