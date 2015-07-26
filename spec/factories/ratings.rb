FactoryGirl.define do
  factory :rating do
    text_review {Faker::Lorem.paragraph(5)}
    rating 5
  end

end