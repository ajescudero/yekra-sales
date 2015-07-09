describe CartsController, type: :controller do

	describe "#checkout" do
		context "when user is logged in" do

		  context "when purchase checkout is requested" do
		  	before(:each) do
		  	  @user = FactoryGirl.create(:user)
		    	@purchase = FactoryGirl.create(:purchase)
					sign_in @user
		  	end

		    xit "changes the purchase status attribute to closed" do 

		    	post :checkout, purchase: FactoryGirl.attributes_for(:purchase) 

		    end

		    xit "redirects to the thanks page" do
		    	post :checkout, purchase: FactoryGirl.attributes_for(:purchase) 

		    	response.should redirect_to checkout_cart_path 
		    end
		  end
		end
	end
end