# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'newtonian/version'

Gem::Specification.new do |spec|
  spec.name          = "newtonian"
  spec.version       = Newtonian::VERSION
  spec.authors       = ["Tobi Lehman"]
  spec.email         = ["mail@tobilehman.com"]

  spec.summary       = %q{An elementary Newtonian physics engine}
  spec.description   = %q{Newtonian physics gives a way to predict the future state of a system of massive objects in a Euclidean space. This gem provides a library of classes such as Point, Vector, Force. This gem enables a system built from these classes to be evolved forward in time according to Newton's laws of motion.}
  spec.homepage      = "https://github.com/tlehman/newtonian"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
