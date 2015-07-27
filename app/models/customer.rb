class Customer < ActiveRecord::Base
    
    validates :email, :password, :first_name, :last_name, presence: true
    validates :email, uniqueness: true

    has_many :order
    has_many :rating

    def create_order
      Order.create(customer_id: self.id, total_prise: 0)
    end

    def current_order
      Order.where(state: "in_progress", customer_id: self.id).last
    end

end
