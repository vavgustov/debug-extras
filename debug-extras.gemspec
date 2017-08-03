# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'debug_extras/version'

Gem::Specification.new do |spec|
  spec.name          = "debug-extras"
  spec.version       = DebugExtras.version
  spec.authors       = ["Vladimir Avgustov"]
  spec.email         = ["vavgustov@gmail.com"]

  spec.summary       = 'Extras for rails debugging.'
  spec.description   = 'Provide debug helper methods for ActionController::Base and ActionView::Base.'
  spec.homepage      = 'https://github.com/vavgustov/debug-extras'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.1.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'awesome_print', '~> 1.8'
  spec.add_runtime_dependency 'actionview', '> 4.0', '< 6'
  spec.add_runtime_dependency 'activesupport', '> 4.0', '< 6'
end
