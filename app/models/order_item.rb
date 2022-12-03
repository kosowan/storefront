class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  # belongs_to :customer

  def total
    product.price * quantity
  end
end
