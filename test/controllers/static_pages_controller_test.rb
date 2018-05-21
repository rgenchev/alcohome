require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  setup do
    category_1 = Category.create!(name: "Vodka", image: fixture_file_upload('images/test_category_image.jpg'))
    category_2 = Category.create!(name: "Gin", image: fixture_file_upload('images/test_category_image.jpg'))
    category_3 = Category.create!(name: "Whiskey", image: fixture_file_upload('images/test_category_image.jpg'))
  end

  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end

  test "should get contact" do
    get contact_url
    assert_response :success
  end
end
