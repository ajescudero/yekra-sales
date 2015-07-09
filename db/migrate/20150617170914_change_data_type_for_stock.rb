class ChangeDataTypeForStock < ActiveRecord::Migration
 def self.up
    change_table :products do |t|
      t.change :stock, :integer
    end
 end

  def self.down
    change_table :products do |t|
      t.change :stock, :decimal
    end
  end
end
