# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alexa_halo/version'

Gem::Specification.new do |spec|
  spec.name          = "alexa_halo"
  spec.version       = AlexaHalo::VERSION
  spec.authors       = ["kylegrantlucas"]
  spec.email         = ["kglucas93@gmail.com"]

  spec.summary       = %q{A sinatra middleware for checking halo stats with alexa.}
  spec.description   = %q{A sinatra middleware for checking halo stats with alexa.}
  spec.homepage      = "http://github.com/kylegrantlucas/alexa_halo"
  spec.license       = "MIT"

  spec.add_runtime_dependency 'sinatra-contrib'
  spec.add_runtime_dependency 'alexa_objects'
  spec.add_runtime_dependency 'halo_stats'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "skills_config"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
