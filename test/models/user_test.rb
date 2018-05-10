require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "username must be less than 20 char" do
    user = User.new(
      firstName: 'aa',
      lastName: 'w',
      email: 'r',
      address: 't',
      phoneNum: '1',
      paymentMethod: 'w')

      # greater than 20 chars
      user.username = 'alfalfatunisiamondayssm'
      assert user.invalid?
      assert_equal ["is too long (maximum is 20 characters)"],
      user.errors[:username]
    end

    test "first name must be present" do
      user = User.new(
        username: 'v',
        lastName: 'r',
        email: 'c',
        address: 'q',
        phoneNum: '8',
        paymentMethod: 'ee')

        # no first name
        user.firstName = ''
        assert user.invalid?
        assert_equal ["can't be blank"],
        user.errors[:firstName]
      end

      test "last name must be present" do
        user = User.new(
          username: 'c',
          firstName: 'e',
          email: 'd',
          address: 's',
          phoneNum: '6',
          paymentMethod: 'i')

          # no last name
          user.lastName = ''
          assert user.invalid?
          assert_equal ["can't be blank"],
          user.errors[:lastName]
        end

        test "email must be present" do
          user = User.new(
            username: 'y',
            firstName: 'b',
            lastName: 'e',
            address: 'w',
            phoneNum: '4',
            paymentMethod: 'h')

            # no email
            user.email = ''
            assert user.invalid?
            assert_equal ["can't be blank"],
            user.errors[:email]
          end

          test "address must be present" do
            user = User.new(
              username: 'mk',
              firstName: 'ff',
              lastName: 'r',
              email: 'ukaj',
              phoneNum: '876',
              paymentMethod: 'wee')

              # no address
              user.address = ''
              assert user.invalid?
              assert_equal ["can't be blank"],
              user.errors[:address]
            end

            test "phoneNum must be present and contain numbers only" do
              user = User.new(
                username: 'uma',
                firstName: 'uy',
                lastName: 'rew',
                email: 'yu',
                address: 'kh',
                paymentMethod: 'cvb')

                # no phoneNum
                user.phoneNum = ''
                assert user.invalid?
                assert_equal ["can't be blank", "is not a number"],
                user.errors[:phoneNum]

                user.phoneNum = 'areuonmimi'
                assert user.invalid?
                assert_equal ["is not a number"],
                user.errors[:phoneNum]
              end

              test "paymentMethod must be present" do
                user = User.new(
                  username: 'nuu',
                  firstName: 'tar ',
                  lastName: 'yg',
                  email: 'ew',
                  phoneNum: '76',
                  address: 'lkjlkjh')

                  # no payment method
                  user.paymentMethod = ''
                  assert user.invalid?
                  assert_equal ["can't be blank"],
                  user.errors[:paymentMethod]
                end

              end
