require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  test "date must be present" do
    reserve = Reservation.new(
      time: '18:30:00',
      table_id: 1,
      user_id: 1,
      num_guests: 2
    )

    #  no date
    reserve.date = ''
    assert reserve.invalid?
    assert_equal ["reservation date is required"],
    reserve.errors[:date]
  end

  test "time must be present" do
    reserve = Reservation.new(
      date: '2018-04-09',
      table_id: 1,
      user_id: 1,
      num_guests: 5
    )

    #  no time
    reserve.time = ''
    assert reserve.invalid?
    assert_equal ["reservation time is required"],
    reserve.errors[:time]
  end

  test "table_id must be present" do
    reserve = Reservation.new(
      date: '2018-05-02',
      time: '14:00:00'
      user_id: 1,
      num_guests: 8
    )

    #  no table id
    reserve.table_id = ''
    assert reserve.invalid?
    assert_equal ["table id is required"],
    reserve.errors[:date]
  end

  test "user_id must be present" do
    reserve = Reservation.new(
      date: '2018-05-23',
      time: '14:00:00',
      table_id: 1,
      num_guests: 6,
    )

    #  no user id
    reserve.user_id = ''
    assert reserve.invalid?
    assert_equal ["user id is required"],
    reserve.errors[:user_id]
  end

  test "number of guests must be present and valid" do
    reserve = Reservation.new(
      date: '2018-06-21',
      time: '15:45:00',
      table_id: 1,
      user_id: 2
    )

    #  no guests
    reserve.num_guests = 0
    assert reserve.invalid?
    assert_equal ["number of guests cannot be zero"],
    reserve.errors[:num_guests]

    # negative num_guests
    reserve.num_guests = -1
    assert reserve.invalid?
    assert_equal ["number of guests cannot be negative"],
    reserve.errors[:num_guests]
  end


end
