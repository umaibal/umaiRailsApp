json.extract! cart_item, :id, :reservation_id, :cart_id, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
