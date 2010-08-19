require "spec_helper"

describe Magento::Customer do
  it "should create a new instance" do
    customer = Magento::Customer.new
    customer.should_not be_nil
  end
  
  describe "firstname" do
    it "should return the correct first name" do
      customer = Magento::Customer.find("1")
      customer["firstname"].should == "Tim"
    end
  end
  
  describe "customer.lastname" do
    it "should return Matheson" do
      customer = Magento::Customer.find("1")
      customer["lastname"].should == "Matheson"
    end
  end
  
  describe "email" do
    it "should return tim.matheson@ordercup.com" do
      customer = Magento::Customer.find("1")
      customer["email"].should == "tim.matheson@ordercup.com"
    end
  end
    
  describe "find" do
    it "should return a customer" do
      customer = Magento::Customer.find("1")
      customer.should_not be_nil
    end
  end
end