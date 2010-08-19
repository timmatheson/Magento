require "spec_helper"

describe Magento::Inventory do
  it "should create a new instance" do
    inventory = Magento::Inventory.new
    inventory.should_not be_nil
  end
  
  describe "list" do
    it "should return product information" do
      inventory = Magento::Inventory.list("1")[0]
      inventory.product_id.should == 1
    end
  end
  
  describe "quantity" do
    it "should return 10" do
      inventory = Magento::Inventory.list("1")[0]
      inventory.qty.to_i.should == 10
    end
  end
  
  describe "sku" do
    it "should return 123456789" do
      inventory = Magento::Inventory.list("1")[0]
      inventory.sku.should == 123456789
    end
  end
  
  describe "first" do
    it "should return the first inventory item" do
      inventory = Magento::Inventory.first
      inventory.should_not be_nil
    end
  end
end