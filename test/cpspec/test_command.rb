require "#{File.expand_path(__FILE__)}/../../test_helper"

module Cpspec
  class TestCommand < Test::Unit::TestCase
    include Vagrant::TestHelpers

    def setup
      @env = vagrant_env
    end

    def test_command
      @env.vms.values.each do |vm|
        vm.env.actions.expects(:run).with(:test)
      end
      @env.cli("run_test")
    end
  end
end
