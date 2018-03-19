class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phoneNum, presence: true
  validates :review, numericality: {less_than_or_equal_to: 5, only_integer: true}
  validates :cuisineType, presence: true, length: {maximum: 75}
  validates :table_id, length: {minimum: 1}

  has_many :tables

    def self.highlyReviewedRestos
      # Get restaurants that have a rating over 4 stars
      Restaurant.select(:name, :address, :review)
                .where("review > ?", 4)
                .order("name ASC")
    end


end
