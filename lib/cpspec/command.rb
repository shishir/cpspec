module Cpspec
  class RunTest < Vagrant::Command::Base
    register "run_test", "Runs a tests for cookbooks inside the VM environment"
    def execute
      target_vms.each {|vm|  vm.env.actions.run(:test)}
    end
  end
end

