class RemoveReservationIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :reservation_id, :integer
  end
end
