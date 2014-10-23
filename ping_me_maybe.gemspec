# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ping_me_maybe/version'

Gem::Specification.new do |spec|
  spec.name          = "ping_me_maybe"
  spec.version       = PingMeMaybe::VERSION
  spec.authors       = ["Chris Clouten"]
  spec.email         = ["chris@harrys.com"]
  spec.summary       = %q{Ping a Cronut server}
  spec.description   = %q{Ping a Cronut server}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
