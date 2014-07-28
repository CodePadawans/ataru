# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ataru/version'

Gem::Specification.new do |spec|
  spec.name          = "ataru"
  spec.version       = Ataru::VERSION
  spec.authors       = ["Code_Padawans"]
  spec.email         = ["hello@code-padawans.de"]
  spec.summary       = %q{A documentation testing tool}
  spec.description   = %q{A documentation testing tool}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
