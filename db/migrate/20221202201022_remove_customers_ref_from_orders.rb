class RemoveCustomersRefFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :Customers, null: false, foreign_key: true
  end
end
