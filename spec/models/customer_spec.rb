require 'rails_helper'

RSpec.describe Customer, type: :model do
    let(:customer) {FactoryGirl.create :customer}

    it {expect(customer).to validate_presence_of(:email)}
    it {expect(customer).to validate_presence_of(:password)}
    it {expect(customer).to validate_presence_of(:first_name)}
    it {expect(customer).to validate_presence_of(:last_name)}

    it {expect(customer).to validate_uniqueness_of(:email)}
    
    it {expect(customer).to have_many(:order)}
    it {expect(customer).to have_many(:rating)}

    pending "A customer should be able to create a new order
      A customer should be able to return a current order in progress"
    
end