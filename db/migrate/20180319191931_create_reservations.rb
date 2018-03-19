class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time
      t.integer :table_id
      t.integer :user_id
      t.integer :num_guests

      t.timestamps
    end
  end
end
