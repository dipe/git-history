require File.expand_path("../lib/git_history/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "git-history"
  s.version     = GitHistory::VERSION
  s.authors     = ["Peter Ehrenberg"]
  s.email       = ["pe@dipe.de"]
  s.homepage    = "http://github.com/dipe/git-history"
  s.summary     = "Create changelog file from git history"
  s.description = "Simply reformats the history of your project based on the commit messages to changelog file format"
  s.files       = `git ls-files`.split($/)
  s.executables = ['git-history']
end
