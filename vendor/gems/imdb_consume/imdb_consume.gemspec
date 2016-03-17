# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imdb_consume/version'

Gem::Specification.new do |spec|
  spec.name          = "imdb_consume"
  spec.version       = ImdbConsume::VERSION
  spec.authors       = ["uar-dejan-susic"]
  spec.email         = ["dejan.susic@excella.com"]

  spec.summary       = %q{API client for IMDB http://www.omdbapi.com/ API}
  spec.description   = %q{USed for accessing the IMDB data over http://www.omdbapi.com/ API. Provided as is only for bootcamp purpose}
  spec.homepage      = "http://www.excella.com/"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency             'faraday'
  spec.add_dependency             'typhoeus'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
