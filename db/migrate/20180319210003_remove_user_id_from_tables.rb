class RemoveUserIdFromTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :tables, :user_id, :integer
  end
end
