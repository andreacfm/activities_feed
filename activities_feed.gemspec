# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activities_feed/version'

Gem::Specification.new do |spec|
  spec.name          = "activities_feed"
  spec.version       = ActivitiesFeed::VERSION
  spec.authors       = ["Andrea Campolonghi"]
  spec.email         = ["acampolonghi@gmail.com"]
  spec.description   = %q{Create an incremental activities feed applying a feedable role to Models}
  spec.summary       = %q{Create an incremental activities feed applying a feedable role to Models}
  spec.homepage      = "https://github.com/andreacfm/activities_feed"
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
