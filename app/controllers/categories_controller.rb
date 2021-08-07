class CategoriesController < ApplicationController 
    before_action :set_article, only: [:show]

    def show 
    end 

    def new 
        @category = Category.new
    end 

    def index 

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
    
    private     
    def set_article 
        @category = Category.find(params[:id])
    end 

    def category_params 
        params.require(:category).permit(:name)
    end 
end 
