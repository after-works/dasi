class CommentsController < ApplicationController
  def create
    @songtag = Songtag.find(params[:comment][:songtag_id])
    
    @comment = Comment.new(params[:comment])
    
    @comment.save
    
    redirect_to @songtag
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
