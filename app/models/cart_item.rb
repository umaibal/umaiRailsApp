class CartItem < ApplicationRecord
  belongs_to :reservation
  belongs_to :cart
end
