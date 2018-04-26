class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    # replace multiple reservations for the same restaurant for
    # a single reservation in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each reservation in the cart
      sums = cart.cart_items.group(:reservation_id).sum(:quantity)

      sums.each do |reservation_id, quantity|
        if quantity > 1
          # remove individual items
          cart.cart_items.where(reservation_id: reservation_id).delete_all

          # replace with a single item
          item = cart.cart_items.build(reservation_id: reservation_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # split items with more than 1 quantity into multiple items
    CartItem.where("quantity>1").each do |cart_item|
      # add individual items
      cart_item.quantity.times do
        CartItem.create(
          cart_id: cart_item.cart_id,
          reservation_id: cart_item.reservation_id,
          quantity: 1
        )
      end
      # remove original item
      cart_item.destroy
    end
  end
end
