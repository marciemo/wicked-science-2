class ArticlesController < ApplicationController
  before_filter :authorize #, only: [:edit, :update]
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    
    if @article.save
      flash[:notice] = "Your article was successfully created."
      redirect_to action: "index"
    else 
      render :new
      flash[:alert] = "YOU BLEW IT!"
    end
  end

  def index
    @articles = Article.all
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to action: "index"
      flash[:notice] = "Your article was successfully updated."
    else
      render :edit
      flash[:alert] = "YOU BLEW IT!"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Your article was obliterated!  I hope you are happy."
    redirect_to action: "index"
  end

end