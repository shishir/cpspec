require 'rake/clean'
TMP_DIR = "/tmp/cpspec"
TMP_TEST_DIR = "#{TMP_DIR}/tests"

CLEAN.include(TMP_DIR)

desc 'run test on the node. config_file = path to knife.rb, node_name = host/ip of the chef managed node'
namespace "chef" do
  task :run_test,[:config_file, :node_name] => [:CLEAN, :find]

  task :do_it, [:config_file, :node_name] do |t, args|
    Chef::Config.from_file(args.config_file)
    cookbook_directory = Chef::Config[:cookbook_path]
    cookbook_list = Chef::Node.load(args.node_name).recipes
    puts "Cookbook path is #{cookbook_directory}"
    puts "Cookbook list for node #{args.node_name} is #{cookbook_list}"

    test_directories = cookbook_list.inject([]) do |cookbook, list|
      cookbook_test_path = "#{cookbook_directory}/#{cookbook}/test"
    end


    mkdir_p(TMP_TEST_DIR)

    test_directories.each do |d|
      Dir["#{d}/**/*.rb"].each do |test_file|
        cp(test_file, TMP_TEST_DIR)
      end
    end
    `tar -cvf #{TMP_DIR} #{TMP_TEST_DIR}`
  end
end

