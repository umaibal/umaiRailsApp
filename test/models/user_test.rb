require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "username must be less than 20 char" do
    user = User.new(
        firstName: 'aa',
        lastName: 'bb',
        email: 'cc',
        address: 'dd',
        phoneNum: '12',
        paymentMethod: 'ee')

    # greater than 20 chars
    user.username = 'alfalfatunisiamondayssm'
    assert user.invalid?
    assert_equal ["must be less than twenty characters"],
    user.errors[:username]
  end

  test "first name must be present" do
    user = User.new(username: 'll'
        lastName: 'bb',
        email: 'cc'
        address: 'dd'
        phoneNum: '12',
        paymentMethod: 'ee')

    # no first name
    user.firstName = ''
    assert user.invalid?
    assert_equal ["first name is required"],
    user.errors[:firstName]
  end

  test "last name must be present" do
    user = User.new(username: 'll'
        firstName: 'bb',
        email: 'cc',
        address: 'dd',
        phoneNum: '12',
        paymentMethod: 'ee')

        # no last name
        user.lastName = ''
        assert user.invalid?
        assert_equal ["last name is required"],
        user.errors[:lastName]
  end

  test "email must be present" do
    user = User.new(username: 'll'
        firstName: 'bb',
        lastName: 're',
        address: 'dd',
        phoneNum: '12',
        paymentMethod: 'ee')

        # no email
        user.email = ''
        assert user.invalid?
        assert_equal ["email is required"],
        user.errors[:email]
  end

  test "address must be present" do
    user = User.new(username: 'll'
        firstName: 'aa',
        lastName: 'bb',
        email: 'cc',
        phoneNum: '12',
        paymentMethod: 'ee')

        # no address
        user.address = ''
        assert user.invalid?
        assert_equal ["address is required"],
        user.errors[:address]
  end

  test "phoneNum must be present and contain numbers only" do
    user = User.new(username: 'll'
        firstName: 'aa',
        lastName: 'bb',
        email: 'cc',
        address: 'po',
        paymentMethod: 'ee')

        # no phoneNum
        user.phoneNum = ''
        assert user.invalid?
        assert_equal ["phoneNum is required"],
        user.errors[:phoneNum]

        user.phoneNum = 'areuonmimi'
        assert user.invalid?
        assert_equal ["phoneNum must consist of numbers"],
        user.errors[:phoneNum]
  end

  test "paymentMethod must be present" do
    user = User.new(username: 'll'
        firstName: 'aa',
        lastName: 'bb',
        email: 'cc',
        phoneNum: '12',
        address: 'po')

        # no payment method
        user.paymentMethod = ''
        assert user.invalid?
        assert_equal ["paymentMethod is required"],
        user.errors[:paymentMethod]
  end

end
