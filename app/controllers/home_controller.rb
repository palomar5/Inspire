class HomeController < ApplicationController

  def index
    @users = User.find(:all, :limit => 10)
  end

end
