class RemoveOrdersRefFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_items, :orders, null: false, foreign_key: true
  end
end
