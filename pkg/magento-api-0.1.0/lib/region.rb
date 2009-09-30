require 'magento'
module Magento #:nodoc:
  class Region < Abstract #:nodoc:
    def self.list(country = nil)
      raise RegionException, "Invalid country code" if country.nil?
      connect
      regions = []
      @connection.call("region.list", country)
    end
  end
  
  class RegionException < StandardError #:nodoc:
  end
end
