class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    attr_accessor :email, :password, :first_name, :last_name

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
