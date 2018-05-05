class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  belongs_to :vendor

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :vendor, presence: true
  validates :image, presence: true

  validates :on_sale, presence: true, :if => :on_sale_price?
  validates :on_sale_price, presence: true, :if => :on_sale?

  scope :on_sale, -> { where(on_sale: true) }
end
