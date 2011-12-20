require File.expand_path(__FILE__) + "/../lib/cpspec"
Vagrant::Config.run do |config|
  config.vm.define :dev do |conf|
    conf.vm.box = "lucid32"
    conf.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "/Users/shishir/Projects/laureate/chef-repo/cookbooks"
     chef.add_recipe "apt"
    end
  end
end
