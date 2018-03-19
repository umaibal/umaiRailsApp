class User < ApplicationRecord
  validates :username, presence: true, uniqueness:true, length: {maximum: 20}
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phoneNum, presence: true, numericality: true
  validates :paymentMethod, presence: true

  has_many :tables, through: :reservations


  def self.mastercardUsersAndCount
    #method that returns first two users that use mastercard for their payments
    User.select("id, username, firstName, lastName, count(id) as mastercardHoldersCount")
        .group(:id)
        .where(paymentMethod: "Mastercard")
        .order(:id)
        .limit(2)
  end

  def self.usersWhoBookedTables
    # method that returns all users who have booked a table
    User.select(:firstName, :lastName)
        .where.not(reservation_id: nil)
        .order(:id)
  end

  def self.updateGuestNum
    # update some records in the existing DB
     User.select("reservations.num_guests")
         .joins("INNER JOIN reservations ON reservations.user_id = user.id")
         .where("reservations.num_guests = ?", 2)
         .limit(1)
         .update_all(num_guests: 7)
  end

  def self.queryUsersWhoBookedFour
    # Get all users who have reserved a seat for four or more people at a restaurant
    User.select(:firstName, :lastName)
        .joins("INNER JOIN reservations ON reservations.user_id = users.id")
        .where("reservations.table_id IS NOT NULL AND reservations.num_guests >= 4")
        .all
  end

end
