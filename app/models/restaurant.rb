class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phoneNum, presence: true
  validates :review, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true}
  validates :cuisineType, presence: true, length: {maximum: 75}
  # validates :table_id, length: {minimum: 1}

  has_many :tables

  def highlyReviewedRestos
    # Get restaurants that have a rating over 4 stars
    # Restaurant.select(:name, :address, :review)
    # .where("review > ?", 4)
    # .order("name ASC")

    # Get min review from restaurants that use Gmail as their email host and have a min greater than 1:
    self.class.group(:name).where('email LIKE ?','%gmail.%').having("min(review) > 1").minimum(:review).first
  end

end
