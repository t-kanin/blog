class SessionsController < ApplicationController

    def new 

    end 

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Login successfully"
            redirect_to root_path 
        else
            flash.now[:alert] = "Invalid email or password"
            render 'new'
        end
    end 

    def destroy
        session[:user_id] =  nil 
        flash[:notice] = "Logout successfully"
        redirect_to login_path
    end 
end 