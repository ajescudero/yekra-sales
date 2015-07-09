class AddUserReferenceToPurchases < ActiveRecord::Migration
  def change
    add_reference :purchases, :user, index: true
  end
end
