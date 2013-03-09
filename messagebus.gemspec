# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'messagebus/version'

Gem::Specification.new do |spec|
  spec.name          = "messagebus"
  spec.version       = Messagebus::VERSION
  spec.authors       = ["David"]
  spec.email         = ["DevilDavidWang@gmail.com"]
  spec.description   = %q{You can use messagebus to push messages from rails server to browser.}
  spec.summary       = %q{Add a message bus for rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "rails", ">= 4.0.0.beta"
end
