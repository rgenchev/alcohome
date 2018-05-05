require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = User.create(email: "admin@example.com", password: "password", role: "admin")
    @user = User.create(email: "user@example.com", password: "password", role: "user")

    @category = Category.create!(name: "Vodka", image: fixture_file_upload('images/test_category_image.jpg'))
    @vendor = Vendor.create(name: "Vendor")
    @product = Product.create(name: "Grey Goose", price: 35.00, category: @category, vendor: @vendor, image: fixture_file_upload('images/test_product_image.jpg'))
  end

  test "should get index" do
    sign_in(@admin)

    get admin_products_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@admin)

    get new_admin_product_url
    assert_response :success
  end

  test "should create product" do
    sign_in(@admin)

    assert_difference('Product.count') do
      post admin_products_url, params: { product: { name: "Belvedere", price: 39.99, category_id: @category.id, vendor_id: @vendor.id, image: fixture_file_upload('images/test_product_image.jpg') } }
    end

    assert_redirected_to admin_product_url(Product.last)
  end

  test "should show product" do
    sign_in(@admin)

    get admin_product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@admin)

    get edit_admin_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    sign_in(@admin)

    patch admin_product_url(@product), params: { product: { name: @product.name, price: @product.price } }
    assert_redirected_to admin_product_url(@product)
  end

  test "should destroy product" do
    sign_in(@admin)

    assert_difference('Product.count', -1) do
      delete admin_product_url(@product)
    end

    assert_redirected_to admin_products_url
  end

  # Non-admin users

  test "non-admin users should not access products index in admin dashboard" do
    sign_in(@user)

    get admin_products_url

    assert_redirected_to "/"
  end

  test "non-admin users should not access new product in admin dashboard" do
    sign_in(@user)

    get new_admin_product_url

    assert_redirected_to "/"
  end

  test "non-admin users should not create new products" do
    sign_in(@user)

    assert_no_difference('Product.count') do
      post admin_products_url, params: { product: { name: "Belvedere", price: 39.99, category_id: @category.id, vendor_id: @vendor.id, image: fixture_file_upload('images/test_product_image.jpg') } }
    end

    assert_redirected_to "/"
  end

  test "non-admin users should not access show product in admin dashboard" do
    sign_in(@user)

    get admin_product_url(@product)

    assert_redirected_to "/"
  end

  test "non-admin users should not get edit in admin dashboard" do
    sign_in(@user)

    get edit_admin_product_url(@product)

    assert_redirected_to "/"
  end

  test "non-admin users should not update products" do
    sign_in(@user)

    patch admin_product_url(@product), params: { product: { name: @product.name, price: @product.price } }

    assert_redirected_to "/"    
  end

  test "non-admin users should not delete products" do
    sign_in(@user)

    assert_no_difference('Product.count') do
      delete admin_product_url(@product)
    end

    assert_redirected_to "/"    
  end
end
