class SessionController < ApplicationController
  	def index
      if current_user != nil
  		  @cur = current_user.name
      end
  	end

  	def create
  		if User.where(name: session_params[:name]).first != nil
	  		session[:user_id] = User.where(name: session_params[:name]).first.id
	  		puts session[:user_id]
	  		user = User.where(name: session_params[:name]).first
	  
	  		if session_params[:password] != user.password
	  			redirect_to auth_fail_path, alert: "Wrong password"
	  		else
	  			redirect_to welcome_dash_path
	  		end
	  	else
	  		redirect_to welcome_index_path, notice: "Invalid Username"
	end

  	end

  	def destroy
      session[:user_id] = nil
      session[:token] = nil
      redirect_to root_url
    end

  	private
  	def session_params
  		params.require(:user).permit(:name, :password)
  	end
end
