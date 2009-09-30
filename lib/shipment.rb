require 'magento'
module Magento #:nodoc:
  class Shipment < Abstract #:nodoc:
    CARRIERS = { :usps => "usps", :ups => "ups", :dhl => "dhl", :fedex => "fedex" }
    
    def self.list(*args)
      connect
      shipments = @connection.call("order_shipment.list",args)
      shipment_list = []
      shipments.each do |order|
        shipment_list.push(order.to_struct(self.class.to_s))
      end
      shipment_list
    end
    
    def self.find(*args)
      connect
      shipment_attributes = @connection.call("order_shipment.info", args)
      new(shipment_attributes)
    end
    
    def self.create(order_id, items, comment = "", notify = false, include_in_email = false)
      connect
      @connection.call("order_shipment.create",order_id, items, comment, notify, include_in_email)
    end
    
    def add_comment(comment = nil, notify = false, include_in_email = false)
      return false if comment.nil?
      @connection.call("order_shipment.addComment",self.increment_id,comment,notify,include_in_email)
    end
    
    def add_tracking_number(carrier_code, number, title = "")
      raise ShipmentException, "Invalid carrier code" unless CARRIERS.values.include?(carrier_code)
      @connection.call("order_shipment.addTrack",self.increment_id,carrier_code,title,number)
    end
    
    def remove_tracking_number(tracking_number_id)
      @connection.call("order_shipment.removeTrack",self.increment_id,tracking_number_id)
    end
    
    def self.get_carriers(order_id)
      @connection.call("order_shipment.getCarriers",order_id)
    end
  end
  
  class ShipmentException < StandardError #:nodoc:
  end
end