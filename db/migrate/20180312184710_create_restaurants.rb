class CreateRestaurants < ActiveRecord::Migration[5.1]

  # using the up/down methods instead of change method
  def up
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phoneNum
      t.string :website
      t.integer :review
      t.string :cuisineType

      t.timestamps
    end

    add_column :restaurants, :menu, :string
  end

  def down
    remove_column :restaurants, :menu

    drop_table :restaurants
  end

end
