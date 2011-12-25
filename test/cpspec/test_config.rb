require "#{File.expand_path(__FILE__)}/../../test_helper"

module Cpspec
  class ConfigTest < Test::Unit::TestCase
    def setup
      @config = Cpspec::Config.new
      @errors = Vagrant::Config::ErrorRecorder.new
    end

    def test_directory_should_be_specified
      @config.validate(@errors)
      assert !@errors.errors.empty?
    end
  end
end
