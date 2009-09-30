#!/usr/bin/ruby
require "test_helper"

class InventoryTest < Test::Unit::TestCase  
  def test_creation
    inventory = Magento::Inventory.new
    assert_not_nil inventory
  end
  
  def test_product_id
    inventory = Magento::Inventory.list("1")[0]
    assert_equal("1",inventory.product_id)
  end
  
  def test_qty
    inventory = Magento::Inventory.list("1")[0]
    assert_equal(10,inventory.qty.to_i)
  end
  
  def test_sku
    inventory = Magento::Inventory.list("1")[0]
    assert_equal("123456789",inventory.sku)
  end
  
  def test_first
    inventory = Magento::Inventory.first
    assert_not_nil inventory
  end
  
end