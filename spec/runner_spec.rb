require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'cpspec/runner'

describe "Runner" do
  it "should respond to run" do
    Cpspec::Runner.should respond_to(:run)
  end

  it "generate the vagrant configuration file" do
    Cpspec::Runner.run
    File.exists?("Vagrantfile").should == true
    expected_content = <<EOH
Vagrant::Config.run do |config|
  config.vm.define "dev" do |conf|
    conf.vm.box = "ubuntu"
    conf.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef-repo/cookbooks"
      chef.add_recipe "vpn"
    end
  end
end
EOH

    content = File.open("Vagrantfile")

    content.read.should == expected_content

  end

  after(:all) do
    File.delete("Vagrantfile")
  end

end
