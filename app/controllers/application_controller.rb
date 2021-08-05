class ApplicationController < ActionController::Base
    # declare the method as helper method as well 
    helper_method :current_user, :logged_in?
    # the method is available for all controllers
    def current_user
        #return current_user if not find the user from the databse 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 
    
    def logged_in?
        # change current_user to bool by adding !! 
        !!current_user
    end 
end
