require 'test_helper'

class VendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vendor = Vendor.create(name: "Coca-Cola")
  end

  test "should get index" do
    get vendors_url
    assert_response :success
  end

  test "should show vendor" do
    get vendor_url(@vendor)
    assert_response :success
  end
end
