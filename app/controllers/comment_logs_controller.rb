class CommentLogsController < ApplicationController
  before_filter :user_only
  after_filter :set_js
  
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

    #redirect_to @songtag
    
    @log_form = CommentLog.new
    
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @cmt_log = CommentLog.find(params[:format])
    @cmt= @cmt_log.comment
    @songtag = @cmt_log.comment.songtag

    @cmt_log.destroy if !@cmt_log.nil?
    
    @log_form = CommentLog.new
    respond_to do |format|
      format.js
    end
  end
  
  private
  def set_js
    response.header['Content-Type']='text/javascript ; charset=utf-8'
  end
end
