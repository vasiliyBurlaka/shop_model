require 'rails_helper'

RSpec.describe Customer, type: :model do
  pending "Should contain email, password, firstname, lastname
    Email, password, firstname, lastname fields should be required
    Email should be unique
    Should have many orders, ratings
    A customer should be able to create a new order
    A customer should be able to return a current order in progress"
    let(:customer) {FactoryGirl.create :customer}

    it {expect(customer).to validate_presence_of(:email)}
    it {expect(customer).to validate_presence_of(:password)}
    it {expect(customer).to validate_presence_of(:first_name)}
    it {expect(customer).to validate_presence_of(:last_name)}

    it {expect(customer).to validate_uniqueness_of(:email)}
    
    it {expect(customer).to have_many(:order)}
    it {expect(customer).to have_many(:rating)}
    
end