class AddQuantityToCartItems < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_items, :quantity, :integer, default: 0
  end
end
