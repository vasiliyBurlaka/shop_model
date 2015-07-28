class Customer < ActiveRecord::Base
    
    validates :email, :password, :first_name, :last_name, presence: true
    validates :email, uniqueness: true

    has_many :orders
    has_many :ratings

    def create_order
      Order.create(customer_id: self.id, total_prise: 0)
    end

    def current_order
      self.orders.where(state: "in_progress").last
    end

end
