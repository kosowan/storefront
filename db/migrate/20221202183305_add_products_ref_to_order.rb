class AddProductsRefToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :Products, null: false, foreign_key: true
  end
end
