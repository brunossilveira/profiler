# Generated by juwelier
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Juwelier::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: brunossilveira-profiler 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "brunossilveira-profiler"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bruno Saibro Silveira"]
  s.date = "2016-07-01"
  s.description = "Analyses file, extracts consumption information on calls, internet usage and SMS"
  s.email = "djbrunosilveira@gmail.com"
  s.executables = ["profiler"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rake_tasks",
    ".rspec",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/profiler",
    "brunossilveira-profiler.gemspec",
    "lib/brunossilveira-profiler.rb",
    "lib/models/row.rb",
    "lib/services/profiler_service.rb",
    "lib/utils/mapper.rb",
    "lib/utils/messages.rb",
    "lib/utils/parser.rb",
    "lib/utils/profiler.rb",
    "spec/models/row_spec.rb",
    "spec/services/profiler_service_spec.rb",
    "spec/spec_helper.rb",
    "spec/test.csv",
    "spec/utils/mapper_spec.rb",
    "spec/utils/parser_spec.rb",
    "spec/utils/profiler_spec.rb"
  ]
  s.homepage = "http://github.com/brunossilveira/profiler"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Report of phone line consumption"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<juwelier>, ["~> 2.1.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<rspec>, ["~> 3.0.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<juwelier>, ["~> 2.1.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<pry-byebug>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 3.0.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<juwelier>, ["~> 2.1.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<pry-byebug>, ["~> 2.0.0"])
  end
end

