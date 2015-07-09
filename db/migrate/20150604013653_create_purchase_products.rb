class CreatePurchaseProducts < ActiveRecord::Migration
  def change
    create_table :purchase_products do |t|
      t.references :product, index: true
      t.references :purchase, index: true
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total_price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
