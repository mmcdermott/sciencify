class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def created_tests
  end

  def main
    redirect_to user_registrations_path(current_user.id)
  end
end
