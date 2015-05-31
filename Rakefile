$LOAD_PATH.unshift File.expand_path('.', __FILE__)
require "./lib/version"

require 'bundler'
require 'rake/testtask'
require 'fileutils'

begin
  require 'bump/tasks'
rescue LoadError
end

task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

desc "release TAG #{PacketsAtRest::ParPluginFacter::VERSION} to github"
task :release do
    system("git tag -a #{PacketsAtRest::ParPluginFacter::VERSION} -m 'release tag #{PacketsAtRest::ParPluginFacter::VERSION}'")
    system("git push origin #{PacketsAtRest::ParPluginFacter::VERSION}")
end
