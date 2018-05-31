class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

	has_many :products, dependent: :destroy

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validate :limited_categories
  validates :name, presence: true
  validates :image, presence: true

  private

    def limited_categories
      if Category.count == 15
        errors[:base] << "There is a limited number of categories."
      end
    end
end
