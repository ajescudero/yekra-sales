class PurchaseProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :purchase

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :purchase_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid.")
    end
  end

  def purchase_present
    if purchase.nil?
      errors.add(:purchase, "is not a valid purchase.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
