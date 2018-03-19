class RemoveReservationIdFromTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :tables, :reservation_id, :integer
  end
end
