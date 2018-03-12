class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phoneNum, presence: true
  validates :review, numericality: {less_than_or_equal_to: 5, only_integer: true}
  validates :cuisineType, presence: true, length: {maximum: 75}
  validates :table_id, length: {minimum: 1}

  has_many :table
end
