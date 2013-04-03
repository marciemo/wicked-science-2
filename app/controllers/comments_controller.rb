class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    
    if @comment.save
      flash[:notice] = "Your comment was successfully added."
      redirect_to action: "new"
    else 
      render :new
      flash[:alert] = "No comment for you!"
    end
  end


end