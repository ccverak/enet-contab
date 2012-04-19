# -*- encoding: utf-8 -*-
#require File.expand_path('../lib/ppp_contab/version', __FILE__)
$:.unshift(File.expand_path('../lib', __FILE__))
require 'ppp_contab/version'

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

  gem.add_dependency("nokogiri", "~> 1.5.0")
  gem.add_dependency("slop", "~> 2.4.2")
  gem.add_dependency("colored", "~> 1.2.0")

  gem.add_development_dependency("rspec", ">= 2.8.0")
  gem.add_development_dependency("guard-rspec")
  gem.add_development_dependency("libnotify")
end
