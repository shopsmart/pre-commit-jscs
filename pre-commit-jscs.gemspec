=begin
Copyright 2016 Eric Agnew eric@bradsdeals.com

See the file LICENSE for copying permission.
=end

# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pre-commit/jscs/version'

Gem::Specification.new do |s|
  s.name     = "pre-commit-jscs"
  s.version  = PreCommit::Jscs::VERSION
  s.author   = "Eric Agnew"
  s.email    = "eric@bradsdeals.com"
  s.homepage = "https://github.com/pre-commit-plugins/pre-commit-jscs"
  s.license  = "MIT"
  s.summary  = "Support for jscs linting"

  s.extra_rdoc_files = ["README.md"]
  s.files = Dir["lib/**/*"]

  s.add_dependency("pre-commit")

  s.add_development_dependency("guard", "~> 2.0")
  s.add_development_dependency("guard-minitest", "~> 2.0")
  s.add_development_dependency("minitest", "~> 4.0")
  s.add_development_dependency("minitest-reporters", "~> 0")
  s.add_development_dependency("mocha", "~>1.1")
  s.add_development_dependency("rake", "~> 10.0")
end
