class User < ApplicationRecord
  validates :username, presence: true, uniqueness:true, length: {maximum: 20}
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phoneNum, presence: true, numericality: true
  validates :paymentMethod, presence: true

  has_many :tables, through: :reservation


  def self.mastercardUsersAndCount
    #method that returns first two users that use mastercard for their payments
    User.select("id, username, firstName, lastName, count(id) as mastercardHoldersCount")
        .group(:id)
        .where(paymentMethod: "Mastercard")
        .order(:id)
        .limit(2)
  end

end
