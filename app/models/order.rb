class Order < ApplicationRecord
  #belongs_to :customers
  has_many :order_items
  has_many :products, through: :order_items

  def total
    order_items.to_a.sum { |order_item| order_item.total }
  end
end
