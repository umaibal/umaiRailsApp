class RemoveTableIdFromRestaurants < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :table_id, :integer
  end
end
