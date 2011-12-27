# encoding: utf-8

require 'rubygems'
require 'bundler'
require 'chef'
require 'rake'
require 'jeweler'
require 'rake/rdoctask'
require 'rake/testtask'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end


Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cpspec #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task_dir = File.expand_path("../tasks", __FILE__)
Dir["#{task_dir}/**/*.rake"].each do |task_file|
  load task_file
end

task :default => :test






