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

    context "#create_order" do
      it "return Order" do
        expect(customer.create_order).to be_instance_of(Order)
      end
      it "change Orders count" do
        expect{customer.create_order}.to change{Order.count}
      end
    end

    context "#current_order" do
      it "return Order" do
        puts customer.create_order
        expect(customer.current_order).to be_instance_of(Order)
      end

    end

    pending "
      A customer should be able to create a new order
      A customer should be able to return a current order in progress"
    
end