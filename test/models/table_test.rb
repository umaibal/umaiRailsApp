require 'test_helper'

class TableTest < ActiveSupport::TestCase
  test "number of seats must be specified, must be greater than or equal to 1 and a whole number" do

    t = Table.new(
      restaurant_id: 1,
      restaurant_id: 2)

    #  no seats
    t.seats = ''
    assert t.invalid?
    assert_equal ["number of seats desired is required"],
    t.errors[:seats]

    # less than one seat
    t.seats = 0
    assert t.invalid?
    assert_equal ["number of seats must be greater than or equal to 1"],
    t.errors[:seats]

    # must be whole number
    t.seats = 4.7
    assert t.invalid?
    assert_equal ["number of seats must be a whole number"],
    t.errors[:seats]

  end

  test "restaurant_id must be present" do

    t = Table.new(
      seats: 3,
      restaurant_id: 1)

    #  no restaurant_id
    t.restaurant_id = ''
    assert t.invalid?
    assert_equal ["restaurant id is required"],
    t.errors[:restaurant_id]

  end
end
