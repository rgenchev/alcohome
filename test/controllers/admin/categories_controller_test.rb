require 'test_helper'

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = User.create(email: "admin@example.com", password: "password", role: "admin")
    @user = User.create(email: "user@example.com", password: "password", role: "user")

    @category = Category.create!(name: "Vodka")
  end

  test "should get index" do
    sign_in(@admin)

    get admin_categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@admin)

    get new_admin_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in(@admin)

    assert_difference('Category.count') do
      post admin_categories_url, params: { category: { name: @category.name } }
    end

    assert_redirected_to admin_category_url(Category.last)
  end

  test "should show category" do
    sign_in(@admin)

    get admin_category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@admin)

    get edit_admin_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    sign_in(@admin)

    patch admin_category_url(@category), params: { category: { name: "Gin" } }

    assert_redirected_to admin_category_url(@category)
  end

  test "should not destroy category" do
    sign_in(@admin)

    assert_difference('Category.count', -1) do
      delete admin_category_url(@category)
    end

    assert_redirected_to admin_categories_url
  end

  # Non-admin users

  test "non-admin users should not access categories index in admin dashboard" do
    sign_in(@user)

    get admin_categories_url

    assert_redirected_to "/"
  end

  test "non-admin users should not access new category in admin dashboard" do
    sign_in(@user)

    get new_admin_category_url

    assert_redirected_to "/"
  end

  test "non-admin users should not create new categories" do
    sign_in(@user)

    assert_no_difference('Category.count') do
      post admin_categories_url, params: { category: { name: @category.name } }
    end

    assert_redirected_to "/"
  end

  test "non-admin users should not access show category in admin dashboard" do
    sign_in(@user)

    get admin_category_url(@category)

    assert_redirected_to "/"
  end

  test "non-admin users should not get edit in admin dashboard" do
    sign_in(@user)

    get edit_admin_category_url(@category)

    assert_redirected_to "/"
  end

  test "non-admin users should not update categories" do
    sign_in(@user)

    patch admin_category_url(@category), params: { category: { name: "Gin" } }

    assert_redirected_to "/"    
  end

  test "non-admin users should not delete categories" do
    sign_in(@user)

    assert_no_difference('Category.count') do
      delete admin_category_url(@category)
    end

    assert_redirected_to "/"    
  end
end
