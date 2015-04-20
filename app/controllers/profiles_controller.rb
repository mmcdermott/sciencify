class ProfilesController < ApplicationController
  before_filter :set_user
  
  def show
  end
  
  def edit
  end
  
  def update
  end

  private
  def set_user
    @user    = User.find(params[:user_id])
    @profile = @user.profile
  end
end
