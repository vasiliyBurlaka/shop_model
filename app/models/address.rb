class Address < ActiveRecord::Base
  validates :address, :zipcode, :city, :phone, presence: true
  belongs_to :country
end
