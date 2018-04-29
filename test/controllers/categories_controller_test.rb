require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create!(name: "Vodka", image: fixture_file_upload('images/test_category_image.jpg'))
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end
end
