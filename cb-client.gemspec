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

  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'multi_xml'
  s.add_dependency 'gyoku'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'mocha'
end
