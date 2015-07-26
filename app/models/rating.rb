class Rating < ActiveRecord::Base
  MINIMUM_RATING = 1
  MAXIMUM_RATING = 10

  validates :text_review, :rating, presence: true

  validates :rating, numericality: {
    only_integer: true, 
    greater_than_or_equal_to: MINIMUM_RATING,
    less_than_or_equal_to: MAXIMUM_RATING
  }

  belongs_to :book
  belongs_to :customer

end
