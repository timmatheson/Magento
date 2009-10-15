require 'magento'
module Magento
  class CustomerAddress < Abstract
    
    def self.list(customer_address_id)
      connect
      @connection.call("customer_address.list", customer_address_id)
    end
    
    def self.find(customer_address_id)
      connect
      @connection.call("customer_address.info", customer_address_id)
    end
    
    def self.create(address_attributes)
      connect
      @connection.call("customer_address.create", address_attributes)
    end
    
    def self.update(address_attributes)
      connect
      @connection.call("customer_address.update", address_attributes)
    end
    
    def self.delete(customer_address_id)
      connect
      @connection.call("customer_address.delete",customer_address_id)
    end
  end
end