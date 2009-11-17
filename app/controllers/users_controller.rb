class UsersController < ApplicationController
  before_filter :require_user, :only => [:edit, :update]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = get_user
  end
  
  def update
    @user = get_user
    @user.update_attributes!(params[:user])
    flash[:notice] = t('users.update.notice')
    redirect_to user_path(@user)
  rescue
    flash[:notice] = t('users.update.error.notice')
    render :action => :edit
  end
  
private
  
  def get_user
    if current_user.id == params[:id].to_i
      current_user
    else
      flash[:notice] = t('not_allowd')
      redirect_to root_path
    end
  end
  
end
