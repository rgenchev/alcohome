require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    category = Category.create!(name: "Vodka", image: fixture_file_upload('images/test_category_image.jpg'))
    vendor = Vendor.create!(name: "Grey Goose")
    @product = Product.create!(name: "Grey Goose", price: 35.00, category: category, vendor: vendor, image: fixture_file_upload('images/test_product_image.jpg'))
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end
end
