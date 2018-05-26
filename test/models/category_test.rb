require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  include ActionDispatch::TestProcess

  test "should have the necessary required validators" do
    category = Category.new

    assert_not category.valid?
    assert_equal [:name, :image], category.errors.keys
  end
  
  test "should not save category without name and image" do
    category = Category.new

    assert_not category.save

    category.name = "Gin"

    assert_not category.save

    category.image = fixture_file_upload 'images/test_category_image.jpg'
  end

  test "categories (at least for now) should be limited" do
    12.times do
      Category.create!(name: "#{rand(10000)}", image: fixture_file_upload('images/test_category_image.jpg'))
    end

    category = Category.new(name: "AF")

    assert_not category.valid?
    assert_equal ["There is a limited number of categories."], category.errors.messages[:base]
  end
end
