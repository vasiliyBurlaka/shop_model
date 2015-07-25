class Book < ActiveRecord::Base

  validates :title, :price, :books_in_stock, presence:true

  belongs_to :category
  belongs_to :author
  has_many :ratings
end
