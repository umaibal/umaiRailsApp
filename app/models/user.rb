class User < ApplicationRecord
  validates :username, presence: true, uniqueness:true, length {maximum:20}
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phoneNum, presence: true, numericality: true
  validates :paymentMethod, presence: true

  has_many :table 
end
