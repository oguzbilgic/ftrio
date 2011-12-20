# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ftrio/version"

Gem::Specification.new do |s|
  s.name        = "ftrio"
  s.version     = Ftrio::VERSION
  s.authors     = ["Oguz Bilgic"]
  s.email       = ["fisyonet@gmail.com"]
  s.homepage    = "https://github.com/oguzbilgic/ftrio"
  s.summary     = %q{Feature managment tool}
  s.description = %q{Feature managment tool}

  s.rubyforge_project = "ftrio"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_runtime_dependency "heroku"
  s.add_runtime_dependency "taps"
end
