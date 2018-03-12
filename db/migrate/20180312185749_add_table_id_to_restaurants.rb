class AddTableIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :table_id, :integer
  end
end
