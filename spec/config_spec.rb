require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Config' do
  it "should store cookbook_name, cookbook_path, recipe" do
    c =  Cpspec::Config.new(
                            {:cookbook_name => "dev",
                              :cookbook_path =>"chef-repo/cookbooks",
                              :recipe =>"vpn",
                              :platform => "ubuntu"
                            }
                            )
    c.cookbook_name.should == "dev"
    c.cookbook_path.should == "chef-repo/cookbooks"
    c.recipe.should == "vpn"
    c.platform.should == "ubuntu"
  end
end
