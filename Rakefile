require 'rubygems'
require 'rubygems/specification'

def gemspec
  @gemspec ||= begin
    file = File.expand_path('../git_history.gemspec', __FILE__)
    eval(File.read(file), binding, file)
  end
end

desc "validate the gemspec"
task :gemspec do
  gemspec.validate
end

desc "Build the gem"
task :build => [:gemspec] do
  mkdir_p "pkg"
  sh "gem build git_history.gemspec"
  mv "#{gemspec.full_name}.gem", "pkg"
end

desc "Push the gem to rubygems.org"
task :push => :build do
  sh "gem push pkg/#{gemspec.full_name}.gem"
end

desc "Install git-history"
task :install => :build do
  sh "gem install pkg/#{gemspec.full_name}.gem"
end
