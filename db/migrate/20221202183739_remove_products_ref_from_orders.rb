class RemoveProductsRefFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :Products, null: false, foreign_key: true
  end
end
