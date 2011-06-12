# -*- encoding: utf-8 -*-
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/ripl/em"
 
Gem::Specification.new do |s|
  s.name        = "ripl-em"
  s.version     = Ripl::Em::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://github.com/cldwalker/ripl-em"
  s.summary = "A ripl plugin to run eventmachine code interactively"
  s.description =  ""
  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency 'ripl', '>= 0.4.2'
  s.add_dependency 'eventmachine'
  s.files = Dir.glob(%w[{lib,test}/**/*.rb bin/* [A-Z]*.{txt,rdoc} ext/**/*.{rb,c} **/deps.rip]) + %w{Rakefile .gemspec}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.license = 'MIT'
end
