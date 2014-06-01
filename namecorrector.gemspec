# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'namecorrector/version'

Gem::Specification.new do |spec|
  spec.name          = "namecorrector"
  spec.version       = Namecorrector::VERSION
  spec.authors       = ["Hermann Faß"]
  spec.email         = ["hermann.fass@vonabiszet.de"]
  spec.summary       = %q{Translate surnames to proper case}
  spec.description   = %q{Turns surnames into proper upper and lower case
spelling)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
