# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: deep_dive 0.2.9 ruby lib

Gem::Specification.new do |s|
  s.name = "deep_dive"
  s.version = "0.2.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Fred Mitchell"]
  s.date = "2015-07-07"
  s.description = "\n  When you have a system of objects that have many references to each other, it becomes an\n  issue to be able to clone properly that object graph. There may be control objects you may\n  not want to clone, but maintain references to. And some references you may not wish to clone at all.\n\n  Enter DeepDive. Allows you a means by which you can do controlled deep cloning or\n  copying of your complex interconnected objects.\n  "
  s.email = "lordalveric@yahoo.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".semver",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "deep_dive.gemspec",
    "lib/deep_dive.rb",
    "lib/deep_dive/deep_dive.rb",
    "spec/lib/deep_dive/deep_dive_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/flajann2/deep_dive"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.4.5"
  s.summary = "DeepDive Deep Contolled Cloning"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2"])
      s.add_development_dependency(%q<rdoc>, ["~> 3"])
      s.add_development_dependency(%q<bundler>, ["~> 1"])
      s.add_development_dependency(%q<jeweler>, ["~> 1"])
      s.add_development_dependency(%q<simplecov>, ["~> 0"])
      s.add_development_dependency(%q<semver>, ["~> 1"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 1"])
      s.add_development_dependency(%q<pry>, ["~> 0"])
      s.add_development_dependency(%q<pry-byebug>, ["~> 3"])
      s.add_development_dependency(%q<pry-doc>, ["~> 0"])
      s.add_development_dependency(%q<pry-remote>, ["~> 0"])
      s.add_development_dependency(%q<pry-rescue>, ["~> 1"])
      s.add_development_dependency(%q<pry-stack_explorer>, ["~> 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2"])
      s.add_dependency(%q<rdoc>, ["~> 3"])
      s.add_dependency(%q<bundler>, ["~> 1"])
      s.add_dependency(%q<jeweler>, ["~> 1"])
      s.add_dependency(%q<simplecov>, ["~> 0"])
      s.add_dependency(%q<semver>, ["~> 1"])
      s.add_dependency(%q<guard-rspec>, ["~> 1"])
      s.add_dependency(%q<pry>, ["~> 0"])
      s.add_dependency(%q<pry-byebug>, ["~> 3"])
      s.add_dependency(%q<pry-doc>, ["~> 0"])
      s.add_dependency(%q<pry-remote>, ["~> 0"])
      s.add_dependency(%q<pry-rescue>, ["~> 1"])
      s.add_dependency(%q<pry-stack_explorer>, ["~> 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2"])
    s.add_dependency(%q<rdoc>, ["~> 3"])
    s.add_dependency(%q<bundler>, ["~> 1"])
    s.add_dependency(%q<jeweler>, ["~> 1"])
    s.add_dependency(%q<simplecov>, ["~> 0"])
    s.add_dependency(%q<semver>, ["~> 1"])
    s.add_dependency(%q<guard-rspec>, ["~> 1"])
    s.add_dependency(%q<pry>, ["~> 0"])
    s.add_dependency(%q<pry-byebug>, ["~> 3"])
    s.add_dependency(%q<pry-doc>, ["~> 0"])
    s.add_dependency(%q<pry-remote>, ["~> 0"])
    s.add_dependency(%q<pry-rescue>, ["~> 1"])
    s.add_dependency(%q<pry-stack_explorer>, ["~> 0"])
  end
end

