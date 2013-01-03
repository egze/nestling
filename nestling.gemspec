# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "nestling/version"

Gem::Specification.new do |s|
  s.name        = "nestling"
  s.version     = Nestling::Version::STRING
  s.authors     = ["Tobias Svensson"]
  s.email       = ["tob@tobiassvensson.co.uk"]
  s.homepage    = "http://github.com/tobiassvn/nestling"
  s.summary     = %q{Ruby wrapper for the EchoNest API}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "multi_json"#, "~> 1.3.7"
end

