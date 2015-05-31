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
