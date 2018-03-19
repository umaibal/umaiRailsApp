require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get query1" do
    get user_query1_url
    assert_response :success
  end

end
