class ProductsController < ApplicationController

	before_filter :authenticate_user!

  def index
    @products = Product.all
    @purchase_product = current_purchase.purchase_products.new
  end
end