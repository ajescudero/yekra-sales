class Product < ActiveRecord::Base
  has_many :purchase_products
  
  validates :stock, presence: true, numericality: { only_integer: true }
end
