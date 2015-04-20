class RegistrationsController < ApplicationController
  def new
    @metric = Metric.find params[:metric_id]
    @registration = @metric.registrations.new
  end

  def create
    @metric = Metric.find params[:metric_id]
    @registration = @metric.registrations.new(registration_params)
    @registration.user_id = current_user.id
    if @registration.save!
      flash[:success] = "You've successfully registered for this metric!"
    else
      flash[:error] = "Oops! Something went wrong."
    end
    redirect_to @metric
  end

  def show
  end

  def edit
  end 

  def update
  end

  def destroy
  end
  
  def index
    @user = User.find(params[:user_id])
    #@registrations = Registration.where user_id: params[:user_id]
    @metrics = @user.metrics
  end

  private
    def registration_params
      params.require(:registration).permit(:expiration_date, :frequency)
    end
end
