# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'usps_flags-grades'
  s.version       = '0.1.3'
  s.date          = '2019-07-19'
  s.summary       = 'Insignia generator for United States Power Squadrons'
  s.description   = 'An extension to the flag image generator for United States Power Squadrons to generate insignia.'
  s.homepage      = 'http://rubygems.org/gems/usps_flags-grades'
  s.license       = 'GPL-3.0'
  s.authors       = ['Julian Fiander']
  s.email         = 'julian@fiander.one'
  s.require_paths = %w[lib spec]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")

  s.required_ruby_version = '~> 2.5'

  s.add_runtime_dependency 'usps_flags', '~> 0.5',  '>= 0.5.5'

  s.add_development_dependency 'rake',          '~> 12.2', '>= 12.2.1'
  s.add_development_dependency 'rspec',         '~> 3.7',  '>= 3.7.0'
  s.add_development_dependency 'rubocop',       '~> 0.71', '>= 0.71.0'
  s.add_development_dependency 'rubocop-rspec', '~> 1.30', '>= 1.30.0'
  s.add_development_dependency 'simplecov',     '~> 0.15', '>= 0.15.1'
end
