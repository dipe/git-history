require File.expand_path("../lib/git_history/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "git-history"
  s.version     = GitHistory::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Peter Ehrenberg"]
  s.email       = ["pe@dipe.de"]
  s.homepage    = "http://github.com/dipe/git-history"
  s.summary     = "Create changelog file from git history"
  s.description = "Simply reformats the history of your project based on the commit messages to changelog file format"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "git-history"

  s.files        = `git ls-files`.split("\n")
  s.executables  = 'git-history'
  s.require_path = 'lib'
end
