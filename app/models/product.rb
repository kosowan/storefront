class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  validates :name, :price, :description, presence: true

  #paginates_per 5
end
