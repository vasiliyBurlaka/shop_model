FactoryGirl.define do
  factory :book do
    title {Faker::Lorem.sentence(2)}
    description {Faker::Lorem.paragraph(5)}
    price 1.5
    books_in_stock 3
  end

end
