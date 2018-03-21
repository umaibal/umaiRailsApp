class Table < ApplicationRecord
  validates :seats, numericality: {greater_than_or_equal_to: 1, only_integer: true}
  # validates :restaurant_id, presence: true
  # validates :user_id, presence: true

  belongs_to :restaurant
  # belongs_to :users, optional: true
  has_many :users, through: :reservations

end
