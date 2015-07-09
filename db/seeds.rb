Product.delete_all
Product.create! id: 1, name: "Banana", price: 0.49, stock: 20
Product.create! id: 2, name: "Apple", price: 0.29, stock: 50
Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, stock: 30

user = User.create! :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'