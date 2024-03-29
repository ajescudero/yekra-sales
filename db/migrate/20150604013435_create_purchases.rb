class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :shipping, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3

      t.timestamps
    end
  end
end
