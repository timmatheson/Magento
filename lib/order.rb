require 'magento'
module Magento
  class Order < Abstract
    def self.list(*args)
      orders = commit("order.list",args)
      order_list = []
      orders.each do |order|
        puts order.inspect
        order_list.push(order.to_struct(self.class.to_s))
      end
      order_list
    end
    
    def self.find(*args)
      order_attributes = commit("order.info", args)
      new(order_attributes)
    end
    
    def add_comment(comment = nil, notify = false)
      return false if comment.nil?
      commit("order.addComment",self.increment_id,"Pending",comment,notify)
    end
    
    def comments
      status_history
    end
    
    def hold
      commit("order.hold",self.increment_id)
    end
    
    def unhold
      commit("order.unhold",self.increment_id)
    end
    
    def cancel
      commit("order.cancel",self.increment_id)
    end
  end
end