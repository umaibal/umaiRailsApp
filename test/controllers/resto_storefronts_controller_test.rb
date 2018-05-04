require 'test_helper'

class RestoStorefrontsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resto_storefront = resto_storefronts(:one)
  end

  test "should get index" do
    get resto_storefronts_url
    assert_response :success
    # assert_select 'nav.side_nav a', minimum: 4
    # assert_select 'main ul.catalog li', 5 #for five items
    assert_select '.review', /^\d+$/ #check if review is a number
  end

  test "should get new" do
    get new_resto_storefront_url
    assert_response :success
  end

  test "should create resto_storefront" do
    assert_difference('RestoStorefront.count') do
      post resto_storefronts_url, params: { resto_storefront: { index: @resto_storefront.index } }
    end

    assert_redirected_to resto_storefront_url(RestoStorefront.last)
  end

  test "should show resto_storefront" do
    get resto_storefront_url(@resto_storefront)
    assert_response :success
  end

  test "should get edit" do
    get edit_resto_storefront_url(@resto_storefront)
    assert_response :success
  end

  test "should update resto_storefront" do
    patch resto_storefront_url(@resto_storefront), params: { resto_storefront: { index: @resto_storefront.index } }
    assert_redirected_to resto_storefront_url(@resto_storefront)
  end

  test "should destroy resto_storefront" do
    assert_difference('RestoStorefront.count', -1) do
      delete resto_storefront_url(@resto_storefront)
    end

    assert_redirected_to resto_storefronts_url
  end
end
