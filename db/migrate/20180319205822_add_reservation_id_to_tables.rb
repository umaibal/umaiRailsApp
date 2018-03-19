class AddReservationIdToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :tables, :reservation_id, :integer
  end
end
