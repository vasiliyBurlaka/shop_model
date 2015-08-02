FactoryGirl.define do
  factory :credit_card do
    number {Faker::Business.credit_card_number}
    cvv {100 + rand(899)}
    expiration_month {1 + rand(11)}
    expiration_year {2010 + rand(10)}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
  end

end
