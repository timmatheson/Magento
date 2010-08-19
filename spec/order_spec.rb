require 'spec_helper'

describe Magento::Order do
  it "should create a new instance" do
    order = Magento::Order.new
    order.should_not be_nil
  end
  
  describe "find" do
    it "should find an order" do
      order = Magento::Order.find("100000001")
      order.should_not be_nil
    end
  end
  
  describe "comments" do
    it "should add a comment" do
      order = Magento::Order.find("100000001")
      comment_text = "This is a test comment #{rand(10)}"
      order.add_comment(comment_text)
      order.comments.map{|c| c.comment }.include?(comment_text).should be_true
    end
  end
  
  describe "list" do
    it "should return an empty list" do
      list = Magento::Order.list
      list.empty?.should be_true
    end
  end
  
  describe "hold" do
    it "should hold an order" do
      Magento::Order.find("100000001").hold.should be_true
    end
  end
  
  describe "unhold" do
    it "should unhold an order" do
      Magento::Order.find("100000001").unhold.should be_true
    end
  end
end