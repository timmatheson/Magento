require 'magento'
require 'abstract'

module Magento
  class Customer < Abstract
    
    def initialize
      connect
    end
    
    def self.find(*args)
      connect
      @connection.call("customer.info",args)
    end
    
    def self.list(*args)
      connect
      customers = @connection.call("customer.list",args)
      customer_list = []
      customers.each do |customer|
        customer_list.push(customer.to_struct(self.class.to_s))
      end
      customer_list
    end 
    
    def self.create(*args)
      connect
      @connection.call("customer.create",args)
    end
    
    def self.delete(customer_id = nil)
      raise CustomerException, "Invalid customer id" if customer_id.nil?
      connect
      @connection.call("customer.delete",customer_id)
    end
  end
  
  class CustomerException < StandardError; end;
end