# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "Q/version"

Gem::Specification.new do |s|
  s.name        = "Q"
  s.version     = Q::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [".rhavin Grobert"]
  s.email       = ["rhavin@shadowtec.de"]
  s.homepage    = "http://rhavin.de"
  s.summary     = %q{core data structures}
  s.description = %q{Bank Account, Phone-Numbers, Addresses and URLs/URIs .}
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
end
