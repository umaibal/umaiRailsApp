class Reservation < ApplicationRecord

  validates :date, presence: true
  validates :time, presence: true
  validates :table_id, presence: true, numericality: {only_integer: true}
  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :num_guests, presence: true, numericality: {only_integer: true}

  belongs_to :user
  belongs_to :table

  def self.restosAndUsersInHollywood
    # select users and restaurants where the address contains the word hollywood
    Reservation.select("users.firstName, users.lastName")
    .joins("INNER JOIN users ON users.id = reservations.user_id")
    .where("users.address LIKE ?", "%Hollywood%")

    # .joins("INNER JOIN restaurants ON restaurants.table_id = reservations.table_id")
    # .where("users.address LIKE ? AND restaurants.address LIKE ?", "%Hollywood%", "%Hollywood%")
    # Find by SQL syntax:
    # Reservation.find_by_sql(["SELECT users.firstName, restaurants.name reservations
    #       JOIN users ON users.id = reservations.user_id
    #       JOIN restaurants ON restaurants.id = reservations.user_id
    #       WHERE users.address LIKE ? AND restaurants.address LIKE ?",
    #       "%Hollywood%", "%Hollywood%"])
  end

  def self.usersWhoBookedTables
    # method that returns all users who have booked a table with seats < 5
    # User.select(:firstName, :lastName)
    #     .where.not(reservation_id: nil)
    #     .order(:id)
    Reservation.select("users.firstName, users.lastName")
    .joins("INNER JOIN users ON users.id = reservations.user_id")
    .joins("INNER JOIN tables ON tables.id = reservations.table_id")
    .where("seats < ?", 5)
    .order(:user_id)
  end


  def self.updateGuestNum
    # update some records in the existing DB
    # User.select("reservations.num_guests")
    #     .joins("INNER JOIN reservations ON reservations.user_id = user.id")
    #     .where("reservations.num_guests = ?", 2)
    #     .limit(1)
    #     .update_all(num_guests: 7)
    Reservation
    .where("reservations.num_guests = ?", 2)
    .limit(1)
    .update_all(num_guests: 7)

    # now that it has been updated, show the username and check if it went through
    Reservation.select("users.username")
    .joins("INNER JOIN users ON reservations.user_id = users.id")
    .where(num_guests: 7)
  end


  def self.queryUsersWhoBookedFour
    # Get all users who have reserved a seat for four or more people at a restaurant
    # User.select(:firstName, :lastName)
    #     .joins("INNER JOIN reservations ON reservations.user_id = users.id")
    #     .where("reservations.table_id IS NOT NULL AND reservations.num_guests >= 4")
    #     .all
    Reservation.select(:firstName, :lastName)
    .joins("INNER JOIN users ON reservations.user_id = users.id")
    .where("reservations.table_id IS NOT NULL AND num_guests >= 4")
    .all
  end


end
