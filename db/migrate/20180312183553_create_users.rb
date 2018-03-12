class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :address
      t.string :phoneNum
      t.string :paymentMethod

      t.timestamps
    end
  end
end
