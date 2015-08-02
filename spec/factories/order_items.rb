FactoryGirl.define do
  factory :order_item do
    price {Faker::Commerce.price}
    quantity {1 + rand(9)}
  end

end
