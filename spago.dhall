{ name = "url-regex-safe"
, dependencies = [ "console", "effect", "psci-support", "strings", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
