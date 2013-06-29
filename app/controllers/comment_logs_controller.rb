class CommentLogsController < ApplicationController
  before_filter :user_only
  
  def create
    @cmt = Comment.find(params[:comment_log][:comment_id])
     
    @songtag = Songtag.find(params[:songtag_id])
    
    if status? @cmt
      redirect_to @songtag
      return
    end
    
    @cmt_log = CommentLog.new(params[:comment_log])
    
    @cmt_log.save
    
    redirect_to @songtag
  end
  
  def destroy
    @cmt_log = CommentLog.find(params[:format])
    
    @songtag = @cmt_log.comment.songtag
    
    @cmt_log.destroy if !@cmt_log.nil?
    
    redirect_to @songtag
  end
end
