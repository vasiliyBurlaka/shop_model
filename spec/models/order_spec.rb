require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:order) {FactoryGirl.create :order}

  it {expect(order).to validate_presence_of(:total_price)}
  it {expect(order).to validate_presence_of(:state)}

  it {expect(order).to have_many(:order_items)}

  it {expect(order).to belong_to(:customer)}
  it {expect(order).to belong_to(:credit_card)}
  it {expect(order).to belong_to(:shipping_address).class_name(Address)}
  it {expect(order).to belong_to(:billing_address).class_name(Address)}

  context ".new" do
    it "state of new Order must be 'in progress'" do
      o = Order.new
      expect(o.state).to eq(Order::STATES[0])
    end
  end


end
