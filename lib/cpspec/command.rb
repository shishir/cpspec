module Cpspec
  class RunTest < Vagrant::Command::Base
    register "run_test", "Runs a tests for cookbooks inside the VM environment"

    argument :filename, :type => :string, :require => true, :desc => "Name of the spec file"

    def execute
      target_vms.each {|vm| execute_on_vm(vm, filename)}
    end

    protected
    def execute_on_vm(vm, filename)
      vm.env.actions.run(:test, "test.file" => filename)
    end
  end
end

