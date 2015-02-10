class ProtectedController < ApplicationController
    def check_if_loggedin
    	if request.env['PATH_INFO'] != "/" && request.env['PATH_INFO'] != "/users/new" && request.env['PATH_INFO'] != "/users"
        	redirect_to root_url if !logged_in
        end
    end
end
