if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Include python syntax first.
runtime! syntax/python.vim

syntax keyword pantsTarget contained
  \ AnnotationProcessor
  \ Artifact
  \ Benchmark
  \ Bundle
  \ Credentials
  \ Exclude
  \ ExportableJvmLibrary
  \ ExternalDependency
  \ InternalTarget
  \ JarDependency
  \ JarLibrary
  \ JavaAntlrLibrary
  \ JavaLibrary
  \ JavaProtobufLibrary
  \ JavaTests
  \ JavaThriftLibrary
  \ JavaThriftstoreDMLLibrary
  \ JvmApp
  \ JvmBinary
  \ JvmTarget
  \ OinkQuery
  \ Page
  \ Pants
  \ PythonAntlrLibrary
  \ PythonArtifact
  \ PythonBinary
  \ PythonLibrary
  \ PythonRequirement
  \ PythonTarget
  \ PythonTestSuite
  \ PythonTests
  \ PythonThriftLibrary
  \ RelativeToMapper
  \ Repository
  \ Resources
  \ ScalaLibrary
  \ ScalaTests
  \ ScalacPlugin
  \ SourceRoot
  \ TargetWithSources
  \ Wiki
  \ WithLegacyResources
  \ annotation_processor
  \ artifact
  \ benchmark
  \ bundle
  \ credentials
  \ dependencies
  \ exclude
  \ fancy_pants
  \ jar
  \ jar_library
  \ java_antlr_library
  \ java_library
  \ java_protobuf_library
  \ java_tests
  \ java_thrift_library
  \ java_thriftstore_dml_library
  \ junit_tests
  \ jvm_app
  \ jvm_binary
  \ oink_query
  \ page
  \ pants
  \ python_antlr_library
  \ python_artifact
  \ python_binary
  \ python_library
  \ python_requirement
  \ python_test_suite
  \ python_tests
  \ python_thrift_library
  \ repo
  \ resources
  \ scala_library
  \ scala_specs
  \ scala_tests
  \ scalac_plugin
  \ setup_py
  \ source_root
  \ wiki

syntax keyword pantsTargetArg contained
  \ allow_pypi
  \ antlr_version
  \ apidocs
  \ base
  \ basedir
  \ basename
  \ binary
  \ buildflags
  \ bundles
  \ classifier
  \ classname
  \ compiler
  \ conf
  \ configurations
  \ coverage
  \ cycle
  \ dependencies
  \ deploy_excludes
  \ deployjar
  \ description
  \ dynamic
  \ entry_point
  \ excludes
  \ exclusives
  \ ext
  \ force
  \ ignore_errors
  \ indices
  \ inherit_path
  \ interpreters
  \ java_sources
  \ language
  \ main
  \ mapper
  \ module
  \ mutable
  \ name
  \ namespace_map
  \ org
  \ password
  \ platforms
  \ plugin
  \ processors
  \ provides
  \ push_db
  \ relative_to
  \ repo
  \ repositories
  \ repository
  \ requirement
  \ resources
  \ rev
  \ rpc_style
  \ soft_dependencies
  \ source
  \ sources
  \ spec
  \ thrift_version
  \ timeout
  \ type_
  \ url
  \ url_builder
  \ username
  \ version_filter
  \ zip_safe

syntax match pythonArgName "\w\+\(\s*=\)\@=" contains=pantsTargetArg transparent
syntax match pythonCall    "\w\+\(\s*(\)\@=" contains=pantsTarget transparent

highlight def link pantsTarget    Statement
highlight def link pantsTargetArg Identifier

let b:current_syntax = "pants"
