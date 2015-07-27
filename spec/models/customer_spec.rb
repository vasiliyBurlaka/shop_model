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
      before do
        @order = customer.create_order
      end

      it "return latest Order" do
        second_order = customer.create_order
        expect(customer.current_order).to eq(second_order)
      end

      it "return Order of current user" do
        expect(customer.current_order.customer_id).to eq(customer.id)
      end

      it "return Order of current user" do
        @order.state = "complited"
        @order.save
        expect(customer.current_order).to eq(nil)
      end

    end

end