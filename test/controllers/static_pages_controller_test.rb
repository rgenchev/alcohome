require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  setup do
    create_categories
  end

  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get about_us" do
    get about_us_url
    assert_response :success
  end

  test "should get contact" do
    get contact_url
    assert_response :success
  end
end
