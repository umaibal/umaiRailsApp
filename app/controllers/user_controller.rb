class UserController < ApplicationController

  # def query4
  #   @users = User.tweets_last1month
  # end

  def query1
    @users = User.mastercardUsersAndCount
  end

  def query2
    @users = User.usersWhoBookedTables
  end

  def query3
    @users = User.updateTableSeats
  end

  def query4
    @users = User.queryUsersWhoBookedTables
  end

end
