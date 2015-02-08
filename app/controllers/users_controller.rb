class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  	u = User.create(user_params)
  	u.save!
  	redirect_to welcome_index_path
  end

  private
  def user_params
  	params.require(:users).permit(:name, :email, :password)
  end
end