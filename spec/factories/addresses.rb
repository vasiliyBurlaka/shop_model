FactoryGirl.define do
  factory :address do
    address {Faker::Address.street_address}
    zipcode {Faker::Address.zip}
    city {Faker::Address.city}
    phone {Faker::PhoneNumber.phone_number}
    country_id 1
  end

end
