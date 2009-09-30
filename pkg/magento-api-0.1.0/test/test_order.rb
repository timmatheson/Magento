require 'test_helper'
class OrderTest < Test::Unit::TestCase
  def test_creation
    order = Magento::Order.new
    assert_not_nil order
  end
  
  def test_find
    order = Magento::Order.find("100000001")
    assert_not_nil order
  end
  
  def test_add_comment
    order = Magento::Order.find("100000001")
    comment_text = "This is a test comment #{rand(10)}"
    order.add_comment(comment_text)
    assert order.comments.map{|c| c.comment }.include?(comment_text)
  end
  
  def test_list
    list = Magento::Order.list
    assert !list.empty?
  end
  
  def test_hold
    assert Magento::Order.find("100000001").hold
  end
  
  def test_unhold
    assert Magento::Order.find("100000001").unhold
  end
end