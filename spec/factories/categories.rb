FactoryGirl.define do
  factory :category do
    title {Faker::Lorem.sentence(2)}
  end

end
