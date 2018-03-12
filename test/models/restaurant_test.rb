require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  test "name must be present" do
    resto = Restaurant.new(
      address: 'sa',
      email: 'tt',
      phoneNum: '32',
      website: 'ww',
      review: 5,
      cuisineType: 'in',
      menu: 'nu',
      table_id: 1
    )

    #  no name
    resto.name = ''
    assert resto.invalid?
    assert_equal ["restaurant name is required"],
    resto.errors[:name]
  end

  test "address must be present" do
    resto = Restaurant.new(
      name: 'ik',
      ]     email: 'tt',
      phoneNum: '32',
      website: 'ww',
      review: 5,
      cuisineType: 'in',
      menu: 'nu',
      table_id: 1
    )

    #  no address
    resto.address = ''
    assert resto.invalid?
    assert_equal ["restaurant address is required"],
    resto.errors[:address]
  end

  test "email must be present" do
    resto = Restaurant.new(
      name: 'yu',
      address: 'sa',
      phoneNum: '32',
      website: 'ww',
      review: 5,
      cuisineType: 'in',
      menu: 'nu',
      table_id: 1
    )

    #  no email
    resto.email = ''
    assert resto.invalid?
    assert_equal ["restaurant email is required"],
    resto.errors[:email]
  end

  test "phoneNum must be present" do
    resto = Restaurant.new(
      name: 'lo',
      address: 'sa',
      email: 'tt',
      website: 'ww',
      review: 5,
      cuisineType: 'in',
      menu: 'nu',
      table_id: 1
    )

    #  no number
    resto.phoneNum = ''
    assert resto.invalid?
    assert_equal ["restaurant phone number is required"],
    resto.errors[:phoneNum]
  end

  test "review must be a number below 5 and whole" do
    resto = Restaurant.new(
      name: 'cam',
      address: 'sa',
      email: 'tt',
      website: 'ww',
      cuisineType: 'in',
      menu: 'nu',
      table_id: 1
    )

    #  number above 5
    resto.review = 7
    assert resto.invalid?
    assert_equal ["restaurant review must be equal to or below 5"],
    resto.errors[:review]

    # number not whole
    resto.name = 3.2
    assert resto.invalid?
    assert_equal ["restaurant review must be a whole number"],
    resto.errors[:review]
  end

  test "cuisineType must be present and below 75 Characters" do
    resto = Restaurant.new(
      name: 'lo',
      address: 'sa',
      email: 'tt',
      website: 'ww',
      review: 5,
      menu: 'nu',
      table_id: 1
    )

    #  no cuisineType
    resto.cuisineType = ''
    assert resto.invalid?
    assert_equal ["restaurant cuisine type is required"],
    resto.errors[:cuisineType]

    # above 75 characters
    resto.cuisineType = 'shelovescontrolallittakesiswooooooolalalalalashelovescontrolwoooooolala'
    assert resto.invalid?
    assert_equal ["restaurant cuisine type must be below 75 characters"],
    resto.errors[:cuisineType]
  end

  # validates :table_id, length: {minimum: 1}
  test "table_id must be at least 1" do
    resto = Restaurant.new(
      name: 'lo',
      address: 'sa',
      email: 'tt',
      website: 'ww',
      review: 5,
      cuisineType: 'in',
      menu: 'nu'    )

    #  invalid id
    resto.table_id = 0
    assert resto.invalid?
    assert_equal ["restaurants table id must be at least 1"],
    resto.errors[:table_id]
  end

end
