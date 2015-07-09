class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_purchase

	#skip_before_filter :authenticate_user!
	before_filter :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  ## TODO: Fix ugly implementation below
  def current_purchase
    if !session[:purchase_id].nil?
      Purchase.find(session[:purchase_id])
    elsif current_user
      user      = current_user
      purchase  = user.purchases.where(:status => "in_progress").last
      if purchase.nil?
        purchase = Purchase.new
        purchase.status   = "in_progress"
        purchase.user     = current_user
        purchase.save

        session[:purchase_id] = purchase.id
      end
      purchase
    else
      purchase = Purchase.new
      purchase.status   = "in_progress"
      purchase.user     = current_user
      purchase.save

      session[:purchase_id] = purchase.id
      purchase
    end
  end

  private

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :remember_me) }
  end

end
