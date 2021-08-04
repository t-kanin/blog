class ArticlesController < ApplicationController
    
    # perform set_article before doing the methods 
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index 
        @articles = Article.paginate(page: params[:page], per_page: 4)
    end 

    def show 
    end 

    def new 
        #the following line prevents the nil class when render 'new' page for the first time due to errors msg 
        @article = Article.new
    end 
    
    def edit 
    end 

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        # as soon as we save the article, it has an id associate with it 
        if @article.save 
            # flash heper to display the message
            flash[:notice] = "Article has been created successfully"
            # article_path(@article) == @article -> same result 
            redirect_to @article 
        else 
            render 'new' 
        end 
    end 

    def update 
        if @article.update(article_params) 
            flash[:notice] = "Article has been updated"
            redirect_to @article
        else 
            render 'edit'
        end 
    end 

    def destroy 
        @article.destroy 
        redirect_to articles_path 
    end 

    # anyting below this is a private method 
    private 
    
    def set_article 
        @article = Article.find(params[:id])
    end 

    def article_params 
        params.require(:article).permit(:title, :description)
    end 
end 