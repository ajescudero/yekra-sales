FactoryGirl.define do
  factory :product do
  	name	{ ["Strawberry", "Apple", "Pear"].sample }
  	price	12.0
  	stock 30
  end
end