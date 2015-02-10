class ProtectedController < ApplicationController
	before_action :check_if_loggedin

    def check_if_loggedin
    	if request.env['PATH_INFO'] != "/" && request.env['PATH_INFO'] != "/users/new"
        	redirect_to root_url if !logged_in
        end
    end
end
