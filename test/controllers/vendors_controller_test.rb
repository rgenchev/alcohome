require 'test_helper'

class VendorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_categories

    category = Category.first
    @vendor = Vendor.create!(name: "Coca-Cola")
  end

  test "should show vendor" do
    get vendor_url(@vendor)
    assert_response :success
  end
end
