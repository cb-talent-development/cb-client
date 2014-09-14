# encoding: utf-8
require File.join(File.dirname(__FILE__), 'lib/cb/client/version')

Gem::Specification.new do |s|
  s.name          = 'cb-client'
  s.version       = CB::Client::VERSION
  s.summary       = 'A Ruby wrapper for CareerBuilder APIs'
  s.description   = s.summary
  s.authors       = ['Bennett Goble']
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec}/**/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'faraday', '~> 0.9'
  s.add_dependency 'faraday_middleware', '~> 0.9'
  s.add_dependency 'multi_xml', '~> 0.5'
  s.add_dependency 'gyoku', '~> 1.1'
  s.add_dependency 'builder', '~> 3.2'
  s.add_dependency 'activesupport-inflector', '~> 0.1'
  s.add_dependency 'i18n', '~> 0.6'

  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'mocha', '~> 1.1'
end
