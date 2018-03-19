require 'test_helper'

class TableControllerTest < ActionDispatch::IntegrationTest
  test "should get query6" do
    get table_query6_url
    assert_response :success
  end

end
