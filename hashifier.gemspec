# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hashifier/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["George Opritescu"]
  gem.email         = ["ssscripting@gmail.com"]
  gem.description   = %q{A utility class for converting I18n keyed strings to appropriate hashes}
  gem.summary       = %q{A utility class for converting I18n keyed strings to appropriate hashes}
  gem.homepage      = ""

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "pry-debugger"
  gem.add_development_dependency "pry-stack_explorer"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hashifier"
  gem.require_paths = ["lib"]
  gem.version       = Hashifier::VERSION
end
