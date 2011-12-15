require 'erb'
require 'cpspec/config'


module Cpspec
  class Runner
    def self.run
      #load configuration file
      #generate vagrant file from template

      cookbook_name = :dev
      cookbook_path = "chef-repo/cookbooks"
      recipe = "vpn"
      config = Config.new({:cookbook_name => cookbook_name, :cookbook_path => cookbook_path, :recipe => recipe, :platform => "ubuntu"})

      template_path = File.dirname(__FILE__)
      content = File.read("#{template_path}/vagrant_template.erb")
      template = ERB.new(content)
      File.open('VagrantFile', 'w') {|f| f.puts template.result(config.get_binding)}
      #provision the box
    end
  end
end
