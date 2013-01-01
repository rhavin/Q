# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "Q/version"

 


Gem::Specification.new do |s|
  s.name          = 'Q'
  s.version       = Q::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = [".rhavin Grobert"]
  s.email         = ["rhavin@shadowtec.de"]
  s.homepage      = "http://rhavin.de"
  s.summary       = %q{core data structures}
  s.description   = %q{Bank Account, Phone-Numbers, Addresses and URLs/URIs .}
  s.files         = `git ls-files`.split($/)
  # we add all files in ext-directory that end in '.c' to executables ending on '.so'
  s.executables   = s.files.grep(%r{^ext/.*c$}).map{ |f| File.basename(f, '.cpp') + '.so'}
  s.extensions    = ['ext/Q/extconf.rb']
  s.bindir        = 'bin'
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
end
