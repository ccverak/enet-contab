# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ppp_contab/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adrian Perez"]
  gem.email         = ["adrianperez.deb@gmail.com"]
  gem.description   = %q{Extract and report PPP account information from enet}
  gem.summary       = gem.descrition
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "ppp_contab"
  gem.require_paths = ["lib"]
  gem.version       = PppContab::VERSION
end
