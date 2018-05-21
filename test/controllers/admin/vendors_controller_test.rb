require 'test_helper'

class Admin::VendorsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = User.create!(email: "admin@example.com", password: "password", role: "admin")
    @user = User.create!(email: "user@example.com", password: "password", role: "user")

    @vendor = Vendor.create(name: "Coca-Cola")
  end

  test "should get index" do
    sign_in(@admin)

    get admin_vendors_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@admin)

    get new_admin_vendor_url
    assert_response :success
  end

  test "should create vendor" do
    sign_in(@admin)

    assert_difference('Vendor.count') do
      post admin_vendors_url, params: { vendor: { description: @vendor.description, name: @vendor.name } }
    end

    assert_redirected_to admin_vendor_url(Vendor.last)
  end

  test "should show vendor" do
    sign_in(@admin)

    get admin_vendor_url(@vendor)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@admin)

    get edit_admin_vendor_url(@vendor)
    assert_response :success
  end

  test "should update vendor" do
    sign_in(@admin)

    patch admin_vendor_url(@vendor), params: { vendor: { description: @vendor.description, name: @vendor.name } }
    assert_redirected_to admin_vendor_url(@vendor)
  end

  test "should destroy vendor" do
    sign_in(@admin)

    assert_difference('Vendor.count', -1) do
      delete admin_vendor_url(@vendor)
    end

    assert_redirected_to admin_vendors_url
  end

  # Non-admin users

  test "non-admin users should not access vendors index in admin dashboard" do
    sign_in(@user)

    get admin_vendors_url

    assert_redirected_to "/"
  end

  test "non-admin users should not access new vendor in admin dashboard" do
    sign_in(@user)

    get new_admin_vendor_url

    assert_redirected_to "/"
  end

  test "non-admin users should not create new vendors" do
    sign_in(@user)

    assert_no_difference('Vendor.count') do
      post admin_vendors_url, params: { vendor: { description: @vendor.description, name: @vendor.name } }
    end

    assert_redirected_to "/"
  end

  test "non-admin users should not access show vendor in admin dashboard" do
    sign_in(@user)

    get admin_vendor_url(@vendor)

    assert_redirected_to "/"
  end

  test "non-admin users should not get edit in admin dashboard" do
    sign_in(@user)

    get edit_admin_vendor_url(@vendor)

    assert_redirected_to "/"
  end

  test "non-admin users should not update vendors" do
    sign_in(@user)

    patch admin_vendor_url(@vendor), params: { vendor: { description: @vendor.description, name: @vendor.name } }

    assert_redirected_to "/"    
  end

  test "non-admin users should not delete vendors" do
    sign_in(@user)

    assert_no_difference('Vendor.count', -1) do
      delete admin_vendor_url(@vendor)
    end

    assert_redirected_to "/"    
  end
end
