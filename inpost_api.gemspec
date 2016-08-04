# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inpost_api/version'

Gem::Specification.new do |spec|
  spec.name          = "inpost_api"
  spec.version       = InpostApi::VERSION
  spec.authors       = ["Damian Śliwecki"]
  spec.email         = ["sliwecki@gmail.com"]
  spec.summary       = spec.description = %q{InPost API}
  spec.homepage      = "www.sliwecki.pl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.7.2"
  spec.add_dependency "json"
  spec.add_dependency "rails", "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec-rails", "~> 2.5"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry"
end
