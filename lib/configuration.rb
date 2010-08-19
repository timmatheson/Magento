require 'yaml'
module Magento
  class Configuration
    attr_accessor :username, :api_key, :host, :path, :port
    
    @@config_path = File.dirname(__FILE__) + "/../config/magento.yml"
    
    def self.config_path=(path)
      @@config_path = path
    end
    
    def initialize
      raise ConfigurationException, "Missing configuration file" unless File.exists?(@@config_path)
      options = YAML.load_file(@@config_path)
      @username = options["username"]
      @api_key  = options["api_key"]
      @host     = options["host"]
      @path     = options["path"]
      @port     = options["port"]
      yield self if block_given?
    end
  end
  
  class ConfigurationException < StandardError; end;
end