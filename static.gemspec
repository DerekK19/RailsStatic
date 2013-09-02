# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'static/version'

Gem::Specification.new do |spec|
  spec.name          = "static"
  spec.version       = Static::VERSION
  spec.authors       = ["Derek Knight (Mac)"]
  spec.email         = ["Derek@GordonKnight.co.uk"]
  spec.description   = "Gem that encapsulates domain specific content"
  spec.summary       = "Domain specific content"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
