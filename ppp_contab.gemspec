# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ppp_contab/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adrian Perez"]
  gem.email         = ["adrianperez.deb@gmail.com"]
  gem.summary       = %q{Extract and report PPP account information from enet}
  gem.description   = gem.description
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ppp_contab"
  gem.require_paths = ["lib"]
  gem.version       = PppContab::VERSION

  gem.add_development_dependency("rspec", ">= 2.8.0")
  gem.add_development_dependency("guard-rspec")
  gem.add_development_dependency("libnotify")
end
