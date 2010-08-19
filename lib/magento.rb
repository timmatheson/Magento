module Magento
  class Connection 
    attr_accessor :client
    def initialize(*args)
      @config = Configuration.new
      @client = XMLRPC::Client.new(@config.host,@config.path,@config.port)
      @session = @client.call("login", @config.username, @config.api_key)
      self
    end
    
    def call(method = nil, *args)
      client.call("call",@session, method, args)
    end
  end
end

require 'extensions'
#require 'xmlrpc'
require 'xmlrpc/client'
require 'abstract'
require 'configuration'
require 'customer'
require 'inventory'
require 'invoice'
require 'order'