require 'magento'
module Magento
  class Inventory < Abstract
    def new(attributes = {})
      attributes.each do |attr, val|
        instance_variable_set(:"@#{attr}",val)
      end
    end
    
    def self.list(*args)
      list = []
      commit("product_stock.list", args).each do |inventory|
        list.push(new(inventory))
      end
      list
    end

    def self.update(id,*args)
      #commit("product_stock.update", args)
      connect
      @connection.call("product_stock.update",id,args)
    end
    
    def update(*args)
      commit("product_stock.update", product_id, args)
    end
    
    def in_stock?
      is_in_stock.to_i == 1
    end
  end
end