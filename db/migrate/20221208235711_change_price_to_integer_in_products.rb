class ChangePriceToIntegerInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :integer
    change_column :products, :sale_price, :integer
    change_column :order_items, :listed_price, :integer
    change_column :orders, :total, :integer
    change_column :orders, :subtotal, :integer
  end
end
