class AddTaxesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :listedgst, :decimal
    add_column :orders, :listedpst, :decimal
    add_column :orders, :listedhst, :decimal
  end
end
