class Category < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :title, presence: true
  has_many :books
end
