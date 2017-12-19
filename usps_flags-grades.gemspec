Gem::Specification.new do |s|
  s.name          = 'usps_flags-grades'
  s.version       = '0.0.2'
  s.date          = '2017-12-19'
  s.summary       = 'Insignia generator for United States Power Squadrons'
  s.description   = 'An extension to the flag image (PNG, SVG) generator for United States Power Squadrons to generate grade insignia.'
  s.homepage      = 'http://rubygems.org/gems/usps_flags-grades'
  s.license       = 'GPL-3.0'
  s.authors       = ['Julian Fiander']
  s.email         = 'julian@fiander.one'
  s.require_paths = ['lib', 'spec']
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")

  s.cert_chain    = ['certs/jfiander.pem']
  s.signing_key   = File.expand_path("~/.ssh/usps_flags-private_key.pem") if $0 =~ /gem\z/

  s.required_ruby_version = '~> 2.4'

  s.add_runtime_dependency 'usps_flags', '~> 0.3',  '>= 0.3.16'

  s.add_development_dependency 'rake',      '~> 12.2', '>= 12.2.1'
  s.add_development_dependency 'rspec',     '~> 3.7',  '>= 3.7.0'
  s.add_development_dependency 'simplecov', '~> 0.15', '>= 0.15.1'
end
