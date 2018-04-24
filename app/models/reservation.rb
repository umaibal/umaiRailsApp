class Reservation < ApplicationRecord

  validates :date, presence: true
  validates :time, presence: true
  validates :table_id, presence: true, numericality: {only_integer: true}
  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :num_guests, presence: true, numericality: {only_integer: true}

  has_many :cart_items

  before_destroy :ensure_not_referenced_by_any_cart_item

  belongs_to :user
  belongs_to :table

  # ensure that no cart items reference this reservation
  def ensure_not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, 'Cart Item present')
      throw :abort
    end
  end
  
  def self.restosAndUsersInHollywood
    # select users and restaurants where the address contains the word hollywood
    Reservation.select("users.firstName, users.lastName")
    .joins("INNER JOIN users ON users.id = reservations.user_id")
    .where("users.address LIKE ?", "%Hollywood%")

  end

  def self.usersWhoBookedTables
    # method that returns all users who have booked a table with seats < 5
    Reservation.select("users.firstName, users.lastName")
    .joins("INNER JOIN users ON users.id = reservations.user_id")
    .joins("INNER JOIN tables ON tables.id = reservations.table_id")
    .where("seats < ?", 5)
    .order(:user_id)
  end


  def self.updateGuestNum
    # update some records in the existing DB
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
    Reservation.select(:firstName, :lastName)
    .joins("INNER JOIN users ON reservations.user_id = users.id")
    .where("reservations.table_id IS NOT NULL AND num_guests >= 4")
    .all
  end


  # added these few queries for more diversity:

  def self.getAfternoonReservationDeets
    # get info about users on reservations made between 12:00 and 16:00
    Reservation.select("users.username, users.phoneNum")
    .joins(:user)
    .where('time BETWEEN ? AND ?', '12:00:00', '16:00:00')
    .order("users.username")
    .limit(1)
  end


  def getRestoIdFromTableInfo
    # get restaurant id based on selecting a table
    Reservation.select("tables.id, tables.restaurant_id")
    .joins(:table)
    .where('tables.seats > ?', 3)
    .order("tables.id").last
  end




end
