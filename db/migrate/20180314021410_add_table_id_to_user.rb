class AddTableIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :table_id, :integer
  end
end
