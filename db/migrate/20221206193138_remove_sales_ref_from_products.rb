class RemoveSalesRefFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :sale, null: false, foreign_key: true
  end
end
