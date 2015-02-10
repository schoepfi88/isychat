class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session,
      #if: Proc.new { |c| c.request.format =~ %r{application/json} }
  
  helper_method :current_user
  helper_method :logged_in

  def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in
    !current_user.nil?
  end


end
