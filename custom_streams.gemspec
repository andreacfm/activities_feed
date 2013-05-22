# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'custom_streams/version'

Gem::Specification.new do |spec|
  spec.name          = "custom_streams"
  spec.version       = CustomStreams::VERSION
  spec.authors       = ["Andrea Campolonghi"]
  spec.email         = ["acampolonghi@gmail.com"]
  spec.description   = %q{Create custom activities streams from a streamer "Model"}
  spec.summary       = %q{Create custom activities streams from a streamer "Model"}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord"
  spec.add_runtime_dependency "rails"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
end
