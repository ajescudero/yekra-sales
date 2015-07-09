describe ProductsController, type: :controller do

	before(:each) do
		user = FactoryGirl.create(:user)
		sign_in user
	end

	xit "populates an array of products" do 

		sign_in user
		product = FactoryGirl.create(:product)
		get :index 
		assigns(:products).should eq([product]) 
	end

	xit "renders the :index view" do 
		get :index 
		response.should render_template :index 
	end
end