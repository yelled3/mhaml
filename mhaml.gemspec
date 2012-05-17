# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mhaml/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ["Danni Friedland"]
  gem.email = ["dannifriedland@gmail.com"]
  gem.description = %q{Shared Mustache+Haml templates for rails 3}
  gem.summary = %q{Shared Mustache+Haml templates for rails 3}
  gem.homepage = "https://github.com/bluehotdog/mhaml"

  #gem.extra_rdoc_files = ["LICENSE", "README.md"]
  gem.rdoc_options = ["--charset=UTF-8"]

  gem.add_runtime_dependency "rails", ">= 3.1.0"
  gem.add_runtime_dependency "tilt", ">= 1.3.3"
  gem.add_runtime_dependency "haml", ">= 3.1.0"
  gem.add_runtime_dependency "sprockets", ">= 2.0.3"
  gem.add_runtime_dependency "mustache", ">= 0.99.4"

  gem.files = `git ls-files`.split($\)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.name = "mhaml"
  gem.require_paths = ["lib"]
  gem.version = MHaml::VERSION
end
