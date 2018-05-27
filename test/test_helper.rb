ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

  # Add more helper methods to be used by all tests here...

  def create_categories
    category_names = ["Champagne", "Wine", "Vodka", "Gin", "Whiskey", "Rum", "Minis", "Soft", "Snacks", "Beer", "Liquor", "Tequila", "Absinthe"]

    category_names.each do |name|
      Category.create!(name: name, image: fixture_file_upload('images/test_category_image.jpg'))
    end
  end
end
