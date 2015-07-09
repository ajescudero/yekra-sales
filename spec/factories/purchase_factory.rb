FactoryGirl.define do
		factory :purchase do
			association :user, :factory => :user
			association :products, :factory => :product, strategy: :build
			subtotal 0
			tax 0
			shipping 0
			total 0
			status "in_process"

			after(:create) do |purchase|
				create_list(:product, purchase: purchase)
			end
		end

end