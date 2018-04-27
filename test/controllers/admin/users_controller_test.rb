require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = User.create!(email: "admin_test@example.com", password: "password", role: "admin")
    @user = User.create!(email: "user_test@example.com", password: "password", role: "user")
  end

  test "should get index" do
    sign_in(@admin)

    get admin_users_url
    assert_response :success
  end

  test "should get new" do
    sign_in(@admin)

    get new_admin_user_url
    assert_response :success
  end

  test "should create user" do
    sign_in(@admin)

    assert_difference('User.count') do
      post admin_users_url, params: { user: { email: "test_user@test.net", password: "test_password", role: "user" } }
    end

    assert_redirected_to admin_user_url(User.last)
  end

  test "should show user" do
    sign_in(@admin)

    get admin_user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    sign_in(@admin)

    get edit_admin_user_path(@user)
    assert_response :success
  end

  test "should update user" do
    sign_in(@admin)

    patch admin_user_url(@user), params: { user: { email: @user.email } }
    assert_redirected_to admin_user_url(@user)
  end

  test "should destroy user" do
    sign_in(@admin)

    assert_difference('User.count', -1) do
      delete admin_user_url(@user)
    end

    assert_redirected_to admin_users_url
  end

  # # Non-admin users

  test "non-admin users should not access users index in admin dashboard" do
    sign_in(@user)

    get admin_users_url

    assert_redirected_to "/"
  end

  test "non-admin users should not access new user in admin dashboard" do
    sign_in(@user)

    get new_admin_user_url

    assert_redirected_to "/"
  end

  test "non-admin users should not create new users" do
    sign_in(@user)

    assert_no_difference('User.count') do
      post admin_users_url, params: { user: { email: "test_user@test.net", password: "test_password", role: "user" } }
    end

    assert_redirected_to "/"
  end

  test "non-admin users should not access show user in admin dashboard" do
    sign_in(@user)

    get admin_user_url(@user)

    assert_redirected_to "/"
  end

  test "non-admin users should not get edit in admin dashboard" do
    sign_in(@user)

    get edit_admin_user_url(@user)

    assert_redirected_to "/"
  end

  test "non-admin users should not update users" do
    sign_in(@user)

    patch admin_user_url(@user), params: { user: { email: @user.email } }

    assert_redirected_to "/"    
  end

  test "non-admin users should not delete users" do
    sign_in(@user)

    assert_no_difference('User.count') do
      delete admin_user_url(@user)
    end

    assert_redirected_to "/"    
  end
end
