class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  belongs_to :vendor

  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :vendor, presence: true
end
