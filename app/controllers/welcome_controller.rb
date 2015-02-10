class WelcomeController < ProtectedController
  def index
  end

  def dash
  	@cur = current_user.name
  end
end
