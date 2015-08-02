class CreditCard < ActiveRecord::Base
  validates :number, :cvv, :expiration_month, :expiration_year,
            :first_name, :last_name, presence: true

  has_many :orders
  belongs_to :customer
end
