module Cpspec
  class Config < Vagrant::Config::Base
    configures :test
    attr_accessor :directory
  end
end
