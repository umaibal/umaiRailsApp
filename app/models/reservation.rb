class Reservation < ApplicationRecord

  validates :date, presence: true
  validates :time, presence: true
  validates :table_id, presence: true, optional: true, numericality: {only_integer: true}
  validates :user_id, presence: true, optional: true, numericality: {only_integer: true}
  validates :num_guests, presence: true, numericality: {only_integer: true}

  belongs_to :users
  belongs_to :tables

  def self.restosAndUsersInHollywood
    # select users and restaurants where the address contains the word hollywood

    Reservation.select("users.firstName, restaurants.name")
               .joins("INNER JOIN users ON users.id = reservations.user_id")
               .joins("INNER JOIN restaurants ON restaurants.table_id = reservations.table_id")
               .where("users.address LIKE ? AND restaurants.address LIKE ?", "%Hollywood%", "%Hollywood%")

    # Find by SQL syntax:
    # Reservation.find_by_sql(["SELECT users.firstName, restaurants.name reservations
    #       JOIN users ON users.id = reservations.user_id
    #       JOIN restaurants ON restaurants.id = reservations.user_id
    #       WHERE users.address LIKE ? AND restaurants.address LIKE ?",
    #       "%Hollywood%", "%Hollywood%"])

  end

end
