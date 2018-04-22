class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

	has_many :products

  validate :limited_categories
  validates :name, presence: true

  private

    def limited_categories
      if Category.count == 9
        errors[:base] << "There is a limited number of categories."
      end
    end
end
