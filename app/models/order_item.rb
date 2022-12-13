class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  # belongs_to :customer

  def total
    product.price * quantity
  end

  def json
    Jbuilder.new do |order_item|
      order_item.listed_price listed_price
      order_item.quantity quantity
    end
  end
end
