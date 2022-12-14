class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_many :products, through: :order_items

  def subtotal
    order_items.to_a.sum { |order_item| order_item.total }
  end

  def total
    taxes = customer.province.gst + customer.province.pst + customer.province.hst
    subtotal + (subtotal * taxes)
  end

  # def listedgst
  #   order_items.to_a.sum { |order_item| order_item.total * customer.province.gst }
  # end

  # def listedpst
  #   order_items.to_a.sum { |order_item| order_item.total * customer.province.pst }
  # end

  # def listedhst
  #   order_items.to_a.sum { |order_item| order_item.total * customer.province.hst }
  # end
end
