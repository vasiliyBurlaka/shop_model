class Order < ActiveRecord::Base
  STATES = ['in_progress', 'complited', 'shipped']

  validates :state, :total_price, presence: true

  belongs_to :customer 
  belongs_to :credit_card
  belongs_to :shipping_address, class_name: Address
  belongs_to :billing_address, class_name: Address

  has_many :order_items

  def recalculate_total_price
    self.total_price = self.order_items.inject(0) {
      |total_price, item| 
      total_price + item.price * item.quantity
    }
  end

  def add_book(params)
    self.order_items.create(params)
    recalculate_total_price
  end

 end
