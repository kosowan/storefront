class RemoveProductsRefFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_items, :Products, null: false, foreign_key: true
  end
end
