require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should have the necessary required validators" do
    category = Category.new

    assert_not category.valid?
    assert_equal [:name], category.errors.keys
  end
  
  test "should not save category without name" do
    category = Category.new

    assert_not category.save

    category.name = "Gin"

    assert category.save
  end

  test "only 9 categories (at least for now) should be limited" do
    9.times do
      Category.create!(name: "#{rand(10000)}")
    end

    category = Category.new(name: "AF")

    assert_not category.valid?
    assert_equal ["There is a limited number of categories."], category.errors.messages[:base]
  end
end
