class Customer < ActiveRecord::Base
    
=begin
    it {expect(customer).to validate_uniqueness_of(:email)}
    
    it {expect(customer).to have_many(:order)}
    it {expect(customer).to have_many(:rating)}
=end

    validates :email, :password, :first_name, :last_name, presence: true
    validates :email, uniqueness: true

    has_many :order
    has_many :rating

end
