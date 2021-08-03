class UsersController < ApplicationController 

    before_action :set_user, only: [:show, :edit, :update]

    def show 
        #grab all the articles associate with the user
        @articles = @user.articles
    end 

    def new 
        @user = User.new
    end 

    def edit 
    end 

    def update 
        if @user.update(user_params)
            flash[:notice] = "Profile has been updated"
            redirect_to root_path
        else 
            render 'edit'
        end 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Register successfully, hello #{@user.username}"
            redirect_to root_path
        else 
            render 'new' 
        end 
    end 

    private 

    #find the user based on the id 
    def set_user
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 
end 