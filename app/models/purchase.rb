class Purchase < ActiveRecord::Base
	has_many :purchase_products
	belongs_to :user
  before_save :update_subtotal

  def subtotal
    purchase_products.collect { |pp| pp.valid? ? (pp.quantity * pp.unit_price) : 0 }.sum
  end

private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
