class CartsController < ApplicationController

	before_filter :authenticate_user!

  def show
  	@purchase = current_purchase
  end

  def checkout
  	current_purchase.purchase_products.each do |p|
  		product = Product.find(p.product_id)
  		product.stock -= p.quantity
  		product.save
  	end

  	purchase = Purchase.find(current_purchase.id)
  	purchase.status = "closed"
  	purchase.save

  	session[:purchase_id] = nil 
  end
end