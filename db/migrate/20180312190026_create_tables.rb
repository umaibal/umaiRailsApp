class CreateTables < ActiveRecord::Migration[5.1]
  def up
    create_table :tables do |t|
      t.integer :seats
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
