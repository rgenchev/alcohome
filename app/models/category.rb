class Category < ApplicationRecord
	has_many :products

  validate :limited_categories

  private

    def limited_categories
      if Category.count == 9
        errors[:base] << "There is a limited number of categories."
      end
    end
end
