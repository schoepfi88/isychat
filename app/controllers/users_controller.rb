class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    if User.where(name: user_params[:name]).first != nil
      redirect_to new_user_path, notice: "User already exist"
    elsif User.where(email: user_params[:email]).first != nil
      redirect_to new_user_path, alert: "E-Mail already in use"
    else
    	u = User.create(user_params)
    	u.save!
    	redirect_to welcome_index_path
    end
  end

  private
  def user_params
  	params.require(:users).permit(:name, :email, :password)
  end
end
