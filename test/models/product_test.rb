require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess
  
  setup do
    @category = Category.create!(name: "Category", image: fixture_file_upload('images/test_category_image.jpg'))
    @vendor = Vendor.create(name: "Vendor")
  end

  test "should have the necessary required validators" do
    product = Product.new

    assert_not product.valid?
    assert_equal [:name, :price, :category, :vendor, :image], product.errors.keys
  end

  test "should not save product without name, price, category, vendor and image" do
    product = Product.new
    assert_not product.save

    product.name = "Grey Goose"
    assert_not product.save

    product.price = 25.99
    assert_not product.save

    product.category = @category
    assert_not product.save

    product.vendor = @vendor
    assert_not product.save

    product.image = fixture_file_upload 'images/test_product_image.jpg'
    assert product.save
  end
end
