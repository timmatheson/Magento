module Magento
  class CustomerGroups < Abstract
    def self.list
      connect
      @connection.call("customer_group.list")
    end
  end
end