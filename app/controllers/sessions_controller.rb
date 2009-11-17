class SessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    UserSession.create!(:email => params[:user_session][:email], :password => params[:user_session][:password])
    redirect_to travels_path
  rescue
    flash[:notice] = t('sessions.create.error.notice')
    redirect_to login_path
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = t('sessions.destroy.notice')
    redirect_back_or_default login_url
  end
end
