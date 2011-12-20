require 'vagrant'
require File.expand_path(__FILE__) + "/../cpspec/command"
require File.expand_path(__FILE__) + "/../cpspec/middleware"

cpspec = Vagrant::Action::Builder.new do
  use Cpspec::Middleware
end

Vagrant::Action.register(:test, cpspec)

