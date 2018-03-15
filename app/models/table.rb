class Table < ApplicationRecord
  validates :seats, numericality: {greater_than_or_equal_to: 1, only_integer: true}
  validates :restaurant_id, presence: true
  validates :user_id, presence: true

  belongs_to :restaurants, optional: true
  belongs_to :users, optional: true


  def self.restosAndUsersInHollywood

    Table.find_by_sql(["SELECT users.firstName, restaurants.name tables
          JOIN users ON users.id = tables.user_id
          JOIN restaurants ON restaurants.id = tables.user_id
          WHERE users.address LIKE ? AND restaurants.address LIKE ?",
          "%Hollywood%", "%Hollywood%"])
    # Table.select("users.firstName, restaurants.name")
    #      .joins("INNER JOIN users ON users.id = tables.user_id")
    #      .joins("INNER JOIN restaurants ON restaurants.id = tables.user_id")
    #      .where("users.address LIKE ? AND restaurants.address LIKE ?", "%Hollywood%", "%Hollywood%")

  end

end
