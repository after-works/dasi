class CommentLogsController < ApplicationController
  before_filter :user_only
  
  respond_to :js
  
  def create
    @cmt = Comment.find(params[:comment_log][:comment_id])
    @songtag = Songtag.find(params[:songtag_id])
    @cmt_log = my_status_choice @cmt

    if @cmt_log.nil?
      @cmt_log = CommentLog.new(params[:comment_log])
      @cmt_log.save
    else
      @cmt_log.update_attribute(:status, params[:comment_log][:status])
    end

    @log_form = CommentLog.new
    @is_best = params[:is_best]
  end

  def destroy
    @cmt_log = CommentLog.find_by_id(params[:format])
    
    if !@cmt_log.nil?
      @cmt = @cmt_log.comment
    
      @songtag = @cmt_log.comment.songtag
    
      @cmt_log.destroy 
    end
    
    @log_form = CommentLog.new
    @is_best = params[:is_best]
  end
end
