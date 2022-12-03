class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def total
    product.price * quantity
  end
end
