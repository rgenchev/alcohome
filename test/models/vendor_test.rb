require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    vendor = Vendor.new

    assert_not vendor.valid?
    assert_equal [:name], vendor.errors.keys
  end
  
  test "should not save vendor without name" do
    vendor = Vendor.new

    assert_not vendor.save

    vendor.name = "Coca-Cola"

    assert vendor.save
  end
end
