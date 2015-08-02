require 'rails_helper'

RSpec.describe CreditCard, type: :model do
    let(:credit_card) {FactoryGirl.create :credit_card}

    it{ expect(credit_card).to validate_presence_of(:number)}
    it{ expect(credit_card).to validate_presence_of(:cvv)}
    it{ expect(credit_card).to validate_presence_of(:expiration_month)}
    it{ expect(credit_card).to validate_presence_of(:expiration_year)}
    it{ expect(credit_card).to validate_presence_of(:first_name)}
    it{ expect(credit_card).to validate_presence_of(:last_name)}

    it{ expect(credit_card).to belong_to(:customer)}
    it{ expect(credit_card).to have_many(:orders)}
end
