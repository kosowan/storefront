class Product < ApplicationRecord
  belongs_to :category
  belongs_to :sale
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image
  validates :name, :price, :description, presence: true

  #paginates_per 5

  def sale_price
    price * sale.sale_percentage
  end
end
