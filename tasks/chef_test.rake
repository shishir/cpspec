desc 'run test on the node. config_file = path to knife.rb, node_name = host/ip of the chef managed node'
namespace "chef" do
  task :run_test,[:config_file, :node_name] => [:find]

  task :do_it, [:config_file, :node_name] do |t, args|
    Chef::Config.from_file(args.config_file)
    cookbook_directory = Chef::Config[:cookbook_path]
    cookbook_list = Chef::Node.load(args.node_name).recipes
    puts "Cookbook path is #{cookbook_directory}"
    puts "Cookbook list for node #{args.node_name} is #{cookbook_list}"

    test_directories = cookbook_list.inject([]) do |cookbook, list|
      cookbook_test_path = "#{cookbook_directory}/#{cookbook}/test"
    end
  end
end
