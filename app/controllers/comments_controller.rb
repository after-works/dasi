class CommentsController < ApplicationController
  before_filter :user_only
  
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
