require 'test_helper'

class RestaurantControllerTest < ActionDispatch::IntegrationTest
  test "should get query5" do
    get restaurant_query5_url
    assert_response :success
  end

end
