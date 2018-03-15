class RestaurantController < ApplicationController

  def query5
    @restaurants = Restaurant.highlyReviewedRestos
  end

end
