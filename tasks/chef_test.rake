require 'rake/clean'
require 'net/ssh'
require 'net/scp'
require 'yaml'
require 'ostruct'

TMP_DIR = "/tmp/cpspec"
TMP_TEST_DIR = "#{TMP_DIR}/tests"

desc 'run test on the node. config_file = path to knife.rb, node_name = host/ip of the chef managed node'

CLEAN.include(TMP_DIR)

namespace :chef do
  task :run_test => [:clean, :do_it]
  
  task :do_it do |t|
    config_file =  ".cpspec.yaml"
    con = YAML.load(File.open(config_file)).to_hash

    configuration = OpenStruct.new(con)
    
    Chef::Config.from_file(configuration.knife_path)
    cookbook_directory = "/Users/shishir/Projects/laureate/chef-repo/cookbooks" || Chef::Config[:cookbook_path]

    cookbook_list = ["ant"] ||Chef::Node.load(configuration.node_name).recipes

    test_directories = cookbook_list.collect {|c| "#{cookbook_directory}/#{c}/tests"}

    mkdir_p(TMP_TEST_DIR)

    test_directories.each do |d|
      Dir["#{d}/**/*.rb"].each do |test_file|
        cp(test_file, TMP_TEST_DIR)
      end
    end

    File.open("#{TMP_TEST_DIR}/runner","w") do |f|
      output = %q{
             Dir["*.rb"].each do |t|
                puts  `/opt/ruby/bin/ruby #{t}`
             end
       }
      f.puts output
    end

    tar_name = "#{TMP_DIR}/tests.tar.gz"
    command = "tar -czvf #{tar_name} -C #{TMP_DIR} tests"
    `#{command}`
    


    remote_path = "/tmp"
    local_path = tar_name

    Net::SCP.start(configuration.remote_host, configuration.user_name, :keys=>[configuration.key], :port => configuration.port) do |scp|
      scp.upload!(local_path, remote_path)
    end

    Net::SSH.start(configuration.remote_host, configuration.user_name, :keys=>[configuration.key], :port => configuration.port) do |ssh|
      output = ssh.exec!("cd #{remote_path}; tar -xzvf tests.tar.gz")
      puts output

      output = ssh.exec!("cd #{remote_path}/tests; /opt/ruby/bin/ruby runner")
      puts output
    end
  end
end
