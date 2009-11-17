class TravelsController < ApplicationController
  before_filter :require_user
  
  def index
    @travels = current_user.travels
  end
  
  def new
    @travel = Travel.new(:user => current_user)
  end
  
  def create
    @travel = Travel.new(params[:travel])
    @travel.user = current_user
    @travel.save!
    flash[:notice] = t('travels.create.notice')
    redirect_to travels_path
  rescue
    flash[:notice] = t('travels.create.error.notice')
    render :action => :new
  end
  
  def destroy
    travel = Travel.find(params[:id])
    if travel.user_id = current_user.id
      travel.destroy
      flash[:notice] = t('travels.destroy.notice')
      redirect_to travels_path
    end
  end
  
end
