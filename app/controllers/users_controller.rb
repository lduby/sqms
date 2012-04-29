class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    if can? :manage, User 
      @users = User.paginate(:page => params[:page])
    end 
  end

  def show
    @user = User.find(params[:id])
  end

end
