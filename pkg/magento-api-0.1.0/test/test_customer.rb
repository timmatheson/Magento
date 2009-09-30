require "test_helper"

class CustomerTest < Test::Unit::TestCase  
  def test_creation
    customer = Magento::Customer.new
    assert_not_nil customer
  end
  
  def test_firstname
    customer = Magento::Customer.find("1")
    assert_equal("Tim",customer["firstname"])
  end
  
  def test_lastname
    customer = Magento::Customer.find("1")
    assert_equal("Matheson",customer["lastname"])
  end
  
  def test_email
    customer = Magento::Customer.find("1")
    assert_equal("tim.matheson@ordercup.com",customer["email"])
  end
    
  def test_find
    customer = Magento::Customer.find("1")
    assert_not_nil customer
  end
end