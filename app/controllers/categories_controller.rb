class CategoriesController < ApplicationController 
    before_action :set_article, only: [:show, :edit, :update]
    before_action :require_admin, except: [:index, :show]

    def show 
        @articles = @category.articles.paginate(page: params[:page], per_page: 4)
    end 

    def new 
        @category = Category.new
    end 

    def index 
        @categories = Category.paginate(page: params[:page], per_page: 4) 
    end 

    def create 
        @category = Category.new(category_params)
        if @category.save 
            flash[:notice] = "The new category has been created"
            redirect_to @category
        else 
            render 'new'
        end 
    end 

    def edit 
    end 
    
    def update 
        if @category.update(category_params)
            flash[:notice] = "The category name has been updated"
            redirect_to @category
        else 
            render 'edit' 
        end 
    end 

    private     
    def set_article 
        @category = Category.find(params[:id])
    end 

    def category_params 
        params.require(:category).permit(:name)
    end 

    def require_admin 
        # first check if the user is logged in
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admin can perform the action"
            redirect_to categories_path
        end 
    end 
    
end 
