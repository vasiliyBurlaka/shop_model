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

  context "#recalculate_total_price" do
    it "when orderItems missing set total_price in 0" do
      order.total_price = 5
      OrderItem.where(order_id: order.id).destroy_all
      order.recalculate_total_price
      expect(order.total_price).to eq(0)
    end
    it "calculate summary price by OrderItems" do
      OrderItem.create(order_id: order.id, price: 5, quantity: 3)
      OrderItem.create(order_id: order.id, price: 2, quantity: 2)
      order.recalculate_total_price
      expect(order.total_price).to eq(19)
    end
    it "calculate price by OrderItems, not by book" do
      book = FactoryGirl.create :book 
      OrderItem.create(order_id: order.id, price: 5, quantity: 3, book_id: book.id)
      order.recalculate_total_price
      expect(order.total_price).to eq(15)
    end
  end

  context "#add_book" do
    context "called with right parameters" do
      item = FactoryGirl.create :order_item
      param = {price: item.price, quantity: item.quantity, book_id: item.book_id}
      it "change count of OrderItems" do
        expect{order.add_book(param)}.to change{order.order_items.count}
      end
      it "change total price" do
        expect{order.add_book(param)}.to change{order.total_price}
      end
    end
    context "called with wrong parameters" do
      it "raise ArgumentError when called without params" do
        expect{order.add_book}.to raise_error(ArgumentError)
      end
      it "raise TypeError when some params missing" do
        expect{order.add_book(price:1)}.to raise_error(TypeError)
      end
    end
  end


end
