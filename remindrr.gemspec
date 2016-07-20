# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'remindrr/version'

Gem::Specification.new do |spec|
  spec.name          = "remindrr"
  spec.version       = Remindrr::VERSION
  spec.authors       = ["Irakli Lekishvili"]
  spec.email         = ["l3kishvili@gmail.com"]

  spec.summary       = %q{Ruby wrapper for remindrr.io API}
  spec.description   = %q{A Ruby wrapper for the Remindrr REST API}
  spec.homepage      = "http://remindrr.io"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'

  spec.add_runtime_dependency 'faraday', '~> 0.9.2'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.10.0'
end
