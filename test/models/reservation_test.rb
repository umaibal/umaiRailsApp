require 'test_helper'

class ReservationTest < ActiveSupport::TestCase

  test "date must be present" do
    reserve = Reservation.new(
      time: '18:30:00',
      table_id: 1,
      user_id: 1,
      num_guests: 2)

      #  no date
      reserve.date = ''
      assert reserve.invalid?
      assert_equal ["can't be blank"],
      reserve.errors[:date]
    end

    test "time must be present" do
      reserve = Reservation.new(
        date: '2018-04-09',
        table_id: 1,
        user_id: 1,
        num_guests: 5)

        #  no time
        reserve.time = ''
        assert reserve.invalid?
        assert_equal ["can't be blank"],
        reserve.errors[:time]
      end

      test "table_id must be present" do
        reserve = Reservation.new(
          date: '2018-05-02',
          time: '14:00:00',
          user_id: 1,
          num_guests: 8)

          #  no table id
          reserve.table_id = ''
          assert reserve.invalid?
          assert_equal ["can't be blank", "is not a number"],
          reserve.errors[:table_id]
        end

        test "user_id must be present" do
          reserve = Reservation.new(
            date: '2018-05-23',
            time: '14:00:00',
            table_id: 1,
            num_guests: 6)

            #  no user id
            reserve.user_id = ''
            assert reserve.invalid?
            assert_equal ["can't be blank", "is not a number"],
            reserve.errors[:user_id]
          end

          test "number of guests must be present and valid" do
            reserve = Reservation.new(
              date: '2018-06-21',
              time: '15:45:00',
              table_id: 1,
              user_id: 2)

              #  no guests
              reserve.num_guests = 0
              assert reserve.invalid?

              # negative num_guests
              reserve.num_guests = -1
              assert reserve.invalid?
            end


          end
