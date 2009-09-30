require 'magento'
module Magento
  class Category < Abstract
    def current_store(store_view = nil)
      connect
      @connection.call("category.currentStore",store_view)
    end
    
    def self.tree(category_id = nil, store_view = nil)
      connect
      fields = [category_id,store_view].compact
      if fields.empty?
        @connection.call("category.level")
      else
        @connection.call("category.level",fields)
      end
    end
    
    def self.level(website = nil, store_view = nil, parent_category = nil)
      connect
      fields = [website,store_view,parent_category].compact
      if fields.empty?
        @connection.call("category.level")
      else
        @connection.call("category.level",fields)
      end
    end
    
    def self.find(category_id, store_view = nil, *args)
      connect
      fields = [store_view].compact
      if fields.empty?
        @connection.call("category.info",category_id)
      else
        @connection.call("category.info",category_id,fields,args)
      end
    end
    
    def self.create(parent_id, category_data, store_view = nil)
      connect
      if store_view.nil?
        @connection.call("category.create", parent_id, category_data)
      else
        @connection.call("category.create", parent_id, category_data, store_view)
      end
    end
    
    def self.update(parent_id, category_data, store_view = nil)
      connect
      if store_view.nil?
        @connection.call("category.update", parent_id, category_data)
      else
        @connection.call("category.update", parent_id, category_data, store_view)
      end
    end
    
    def self.move(category_id, parent_id, after_id)
      connect
      @connection.call("category.move", category_id, parent_id, after_id)
    end
    
    def self.delete(category_id)
      connect
      @connection.call("category.delete",category_id)
    end
    
    def self.assigned_products(category_id, store_id)
      connect
      @connection.call("category.assignedProducts",category_id, store_id)
    end
    
    def assigned_products(store_id)
      if store_id
        Category.assigned_products(self.id, store_id)
      else
        Category.assigned_products(self.id)
      end
    end
    
    def assign_product(product_id)
      connect
      @connection.call("category.assignProduct",self.id, product_id)
    end
    
    def update_product(product_id, position = 1)
      connect
      @connection.call("category.updateProduct",self.id, product_id, position)
    end
    
    def remove_product(product_id)
      connect
      @connection.call("category.removeProduct",self.id, product_id)
    end
    
  end
end