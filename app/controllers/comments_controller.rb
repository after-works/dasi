class CommentsController < ApplicationController
  before_filter :user_only
  
  def create
    @songtag = Songtag.find(params[:comment][:songtag_id])
    
    @comment = Comment.new(params[:comment])
    
    @comment.save
    
    @comment_form = Comment.new
    
    @comment_log = CommentLog.new
    
    @is_recmt = !@comment.parent_cmt_id.nil?
    
    respond_to do |format|
      format.js
    end
     
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
