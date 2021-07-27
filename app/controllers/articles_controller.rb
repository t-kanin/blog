class ArticlesController < ApplicationController

    def index 
        @articles = Article.all 
    end 

    def show 
        @article = Article.find(params[:id])
    end 

    def new 
        #the following line prevents the nil class when render 'new' page for the first time due to errors msg 
        @article = Article.new
    end 
    
    def edit 
        @article = Article.find(params[:id])
    end 

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
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
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description)) 
            flash[:notice] = "Article has been updated"
            redirect_to @article
        else 
            render 'edit'
        end 
    end 

    def destroy 
        @article = Article.find(params[:id])
        @article.destroy 
        redirect_to articles_path 
    end 
end 