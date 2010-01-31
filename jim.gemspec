# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jim}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Quint"]
  s.date = %q{2010-01-31}
  s.default_executable = %q{jim}
  s.description = %q{jim is your friendly javascript package manager}
  s.email = %q{aaron@quirkey.com}
  s.executables = ["jim"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "bin/jim",
     "jim.gemspec",
     "lib/jim.rb",
     "lib/jim/bundler.rb",
     "lib/jim/cli.rb",
     "lib/jim/index.rb",
     "lib/jim/installer.rb",
     "lib/jim/rack.rb",
     "lib/jim/templates/commands",
     "lib/jim/templates/jimfile",
     "test/fixtures/infoincomments.js",
     "test/fixtures/jimfile",
     "test/fixtures/jquery-1.4.1.js",
     "test/fixtures/jquery.metadata-2.0.zip",
     "test/fixtures/noversion.js",
     "test/helper.rb",
     "test/test_jim_bundler.rb",
     "test/test_jim_cli.rb",
     "test/test_jim_index.rb",
     "test/test_jim_installer.rb"
  ]
  s.homepage = %q{http://github.com/quirkey/jim}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{jim is your friendly javascript package manager}
  s.test_files = [
    "test/helper.rb",
     "test/test_jim_bundler.rb",
     "test/test_jim_cli.rb",
     "test/test_jim_index.rb",
     "test/test_jim_installer.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
  end
end

