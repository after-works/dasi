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
  
  def paging
    @page = params[:comment][:page]
    
    if @page.to_i <2
      @page = 2
    end
    
    @songtag = Songtag.find_by_id(params[:comment][:songtag_id])
    
    @comment_log = CommentLog.new
    @comment_form = Comment.new

    @comments = @songtag.comments.
                paginate(:per_page=>10, :page=>@page).
                find(:all, :conditions=>"parent_cmt_id is null", :order=>'created_at DESC')

    @is_last = false;
    if @comments.total_pages <= @comments.current_page
      @next_page = @page
      @is_last = true
    else
      @next_page = @page.to_i + 1 # paging 했다면...
    end

    respond_to do |format|
      format.js
    end
  end
  
  def recmt_paging
    @page = params[:comment][:page]
    
    if @page.to_i < 2
      @page = 2
    end
    
    @parent_cmt = Comment.find_by_id(params[:comment][:parent_cmt_id])
    
    @re_cmts = @parent_cmt.re_comments.paginate(:per_page=>3, :page=>@page).order("created_at ASC")
    
    @is_last = false;
    
    if @re_cmts.total_pages <= @re_cmts.current_page
      @next_page = @page
      @is_last = true
    else
      @next_page = @page.to_i + 1
    end
    
    @comment_log = CommentLog.new
    respond_to do |format|
      format.js
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
