class Order < ActiveRecord::Base
  STATES = ['in_progress', 'complited', 'shipped']

  validates :state, :total_price, presence: true

  belongs_to :customer 
  belongs_to :credit_card
  belongs_to :shipping_address, class_name: Address
  belongs_to :billing_address, class_name: Address

  has_many :order_items

end
