Sales::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :products, only: [:index]
  resource :cart, only: [:show] do
  	post 'checkout'
  end
  resources :purchase_products, only: [:create, :update, :destroy]
  root to: "products#index"
end
