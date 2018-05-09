class Order < ApplicationRecord
  validates :username, presence: true
end
