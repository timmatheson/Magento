require 'yaml'
module Magento
  class Configuration
    attr_accessor :username, :api_key, :host, :path, :port
    
    CONFIG_PATH = File.dirname(__FILE__) + "/../config/magento.yml"
    
    def initialize
      raise ConfigurationException, "Missing configuration file" unless File.exists?(CONFIG_PATH)
      options = YAML.load_file(CONFIG_PATH)
      @username = options["username"]
      @api_key  = options["api_key"]
      @host     = options["host"]
      @path     = options["path"]
      @port     = options["port"]
      yield self if block_given?
    end
  end
  
  class ConfigurationException; end;
end