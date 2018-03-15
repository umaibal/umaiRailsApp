class TableController < ApplicationController

  def query6
    @tables = Table.restosAndUsersInHollywood
  end

end
