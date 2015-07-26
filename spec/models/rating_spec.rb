require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) {FactoryGirl.create :rating}

  it {expect(rating).to belong_to(:book)}
  it {expect(rating).to belong_to(:customer)}

  it {expect(subject).to validate_presence_of(:text_review)}
  it {expect(subject).to validate_presence_of(:rating)}
  it {expect(rating).to validate_numericality_of(:rating).only_integer}
  it {expect(rating).to validate_numericality_of(:rating).is_greater_than_or_equal_to Rating::MINIMUM_RATING}
  it {expect(rating).to validate_numericality_of(:rating).is_less_than_or_equal_to Rating::MAXIMUM_RATING}

end
