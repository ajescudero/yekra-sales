class PurchaseProductsController < ApplicationController
  def create
    @purchase = current_purchase
    @purchase_product = @purchase.purchase_products.new(purchase_product_params)
    @purchase.save
    session[:purchase_id] = @purchase.id
  end

  def update
    @purchase = current_purchase
    @purchase_product = @purchase.purchase_products.find(params[:id])
    @purchase_product.update_attributes(purchase_product_params)
    @purchase_products = @purchase.purchase_products
  end

  def destroy
    @purchase = current_purchase
    @purchase_product = @purchase.purchase_products.find(params[:id])
    @purchase_product.destroy
    @purchase_products = @purchase.purchase_products
  end

private
  def purchase_product_params
    params.require(:purchase_product).permit(:quantity, :product_id)
  end
end
