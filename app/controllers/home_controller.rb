class HomeController < ApplicationController

  before_filter :get_user
  before_filter :accessible_roles
  
  def index
    @users = User.all
  end

end
