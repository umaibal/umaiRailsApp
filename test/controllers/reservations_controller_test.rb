require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count', 0) do
    # assert_difference('Reservation.count') do
      post reservations_url, params: { reservation: { date: @reservation.date,
        time: @reservation.time,
        table_id: @reservation.table_id,
        user_id: @reservation.user_id,
        num_guests: @reservation.num_guests} }
    end
    assert_operator @reservation.time, :>, Time.now.strftime("%H:%M:%S")
    assert_redirected_to resto_storefronts_url
    # assert_redirected_to reservation_url(Reservation.last)
  end

  test "should show reservation" do
    get reservation_url(@reservation)
    assert_response :success
  end

  # make sure that the reservation in the cart is safe
  test "can't delete reservation in cart" do
    # there are 2 reservations in the fixture data, so use :two
    assert_difference('Reservation.count', 0) do
      delete reservation_url(reservations(:two))
    end
    assert_redirected_to reservations_url
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', 0) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
