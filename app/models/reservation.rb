class Reservation < ApplicationRecord

  validates :date, presence: true
  validates :time, presence: true
  validates :table_id, presence: true, optional: true, numericality: {only_integer: true}
  validates :user_id, presence: true, optional: true, numericality: {only_integer: true}
  validates :num_guests, presence: true, numericality: {only_integer: true}

  belongs_to :users
  belongs_to :tables

end
