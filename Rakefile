# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "cpspec"
  gem.homepage = "http://github.com/shishir/cpspec"
  gem.license = "MIT"
  gem.summary = %Q{testing framework for chef and puppet}
  gem.description = %Q{lets to run your chef cookbooks or puppet manifest again local vm and runs test on it}
  gem.email = "shishir.das@gmail.com"
  gem.authors = ["Shishir Das"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cpspec #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/test*.rb']
  t.verbose = true
end

desc 'run test on the target vm'
task :run_test => [:find, :zip, :scp, :execute]

task :find do |t|
  #parse Vagrant file for it
  cookbook_path = 'cookbooks'

  #Chef query to determine the run_list.
  cookbook_list = ''
end

task :zip do |t|
#zip it up
end

task :scp do |t|
# scp into box
  
end

task :exec do |t|
  #execute on the vm
end

