require 'magento'
module Magento
  class Country < Abstract
    def self.list
      connect
      @connection.call("country.list")
    end
  end
end