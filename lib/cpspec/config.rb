module Cpspec
  class Config < Vagrant::Config::Base
    configures :test
    attr_accessor :directory

    def validate(errors)
      errors.add("You need a test directory") if !directory
    end
  end
end
