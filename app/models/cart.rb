class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_reservation(reservation)
    current_item = cart_items.find_by(reservation_id: reservation.id)
    if current_item # increment reservation count
      current_item.quantity += 1
    else # build a new one if there are no items in the cart
      current_item = cart_items.build(reservation_id: reservation.id)
    end
    current_item
  end
end
