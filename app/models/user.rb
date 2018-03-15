class User < ApplicationRecord
  validates :username, presence: true, uniqueness:true, length: {maximum: 20}
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :phoneNum, presence: true, numericality: true
  validates :paymentMethod, presence: true

  has_many :tables

  def self.mastercardUsersAndCount
    #method that returns first two users that use mastercard for their payments
    User.select("user_id, count(user_id) as mastercardHoldersCount")
        .group(:user_id)
        .where(paymentMethod: "Mastercard")
        .order(:user_id)
        .limit(2)
  end

  def self.usersWhoBookedTables
    # method that returns all users who have booked a table
    User.select(:firstName, :lastName)
        .where(:table_id.nil? == true)
        .order(:user_id)
  end

  def self.updateTableSeats
    # update/delete some records in the existing DB
     User.select("tables.seats")
         .joins("INNER JOIN tables ON tables.user_id = users.id")
         .where("tables.seats = ?", 2)
         .limit(1)
         .update_attribute(:seats=>7)
  end

  def self.queryUsersWhoBookedTables
    # Get all users who have booked a seat for four or more people at a restaurant
    User.select(:firstName, :lastName)
        .joins("INNER JOIN tables ON tables.user_id = users.user_id")
        .where("users.table_id IS NOT NULL AND users.seats >= 4")
        .all
  end

end
