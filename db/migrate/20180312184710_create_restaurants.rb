class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
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
  end
end
