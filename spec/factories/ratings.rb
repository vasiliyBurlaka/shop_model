FactoryGirl.define do
  factory :rating do
    text_review {Faker::Lorem.paragraph(5)}
    rating {1 + rand(10)}
  end

end