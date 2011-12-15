module Cpspec
  class Config
    attr_reader :cookbook_name, :cookbook_path, :recipe, :platform
    def initialize(props = {})
      @cookbook_name = props[:cookbook_name]
      @cookbook_path = props[:cookbook_path]
      @recipe = props[:recipe]
      @platform = props[:platform]
    end

    def get_binding
      binding
    end
  end
end
