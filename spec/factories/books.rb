FactoryGirl.define do
  factory :book do
    title {Faker::Lorem.sentence(2)}
    description {Faker::Lorem.paragraph(5)}
    price {Faker::Commerce.price}
    books_in_stock {5 + rand(50)}
  end

end
