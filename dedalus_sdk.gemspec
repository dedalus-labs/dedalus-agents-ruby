# frozen_string_literal: true

require_relative "lib/dedalus_sdk/version"

Gem::Specification.new do |s|
  s.name = "dedalus-sdk"
  s.version = DedalusSDK::VERSION
  s.summary = "Ruby library to access the Dedalus API"
  s.authors = ["Dedalus"]
  s.email = "oss@dedaluslabs.ai"
  s.homepage = "https://gemdocs.org/gems/dedalus-sdk"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/dedalus-labs/dedalus-sdk-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
