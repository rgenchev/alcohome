require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    category = Category.create(name: "Vodka")
    vendor = Vendor.create(name: "Grey Goose")
    @product = Product.create(name: "Grey Goose", price: 35.00, category: category, vendor: vendor)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_product_url
  #   assert_response :success
  # end

  # test "should create product" do
  #   assert_difference('Product.count') do
  #     post products_url, params: { product: { name: @product.name, price: @product.price } }
  #   end

  #   assert_redirected_to product_url(Product.last)
  # end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_product_url(@product)
  #   assert_response :success
  # end

  # test "should update product" do
  #   patch product_url(@product), params: { product: { name: @product.name, price: @product.price } }
  #   assert_redirected_to product_url(@product)
  # end

  # test "should destroy product" do
  #   assert_difference('Product.count', -1) do
  #     delete product_url(@product)
  #   end

  #   assert_redirected_to products_url
  # end
end
