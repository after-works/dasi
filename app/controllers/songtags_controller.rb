class SongtagsController < ApplicationController
  before_filter :user_only
  include SongsHelper
  include SongtagsHelper
  
  def show
    @songtag = Songtag.find(params[:id])

    # vote에 따라 소팅 필요
    @songs = sort_songs(@songtag.songs.order("created_at DESC"))

    # 날자순으로 소팅
    @comments = @songtag.comments.
                paginate(:per_page=>10, :page=>1).
                find(:all, :conditions=>"parent_cmt_id is null", :order=>'created_at DESC')
                
    @best_comments = Comment.joins(:comment_logs).
                             select("comments.* , sum(status) as accum").
                             where("comments.songtag_id=#{@songtag.id} and comment_logs.status=1").
                             group("comments.id").
                             order("accum DESC").
                             limit(2)
                             
    logger.debug @best_comments

    @comment_form = Comment.new
    @comment_log = CommentLog.new

    @current_song = @songs[0]

    @song_form = Song.new
    
    if !params[:song_id].nil?
      @songs.each do |s|
        if s.id == params[:song_id].to_i
          @current_song = s
        end
      end
    end
  end

  #need to edit
  def create
    @songtag = Songtag.new
    @songtag.uid = params[:songtag][:uid]
    @songtag.title = params[:songtag][:title]
    
    @songtag.save
    
    add_songs = params[:songtag][:song]
    
    add_songs.each do |s|
      song = Song.new
      song.title = s[:title]
      song.tag_id = @songtag.id
      song.youtube_id = s[:youtube_id]
      song.uid = params[:songtag][:uid]
      song.save
    end
    
    redirect_to @songtag

  end

  def index
    @category = nil
    if (!params[:category].nil?) || !(params[:category] == "")
      @category = params[:category]
    end
    @songtags = fetch_songtags(@category, 1)
  end

  def show_song
    @current_song = Song.find_by_id params[:id]

    if current_song.nil?

    end

    @songtag = current_song.songtag
    @songs = @songtag.songs
    @comments = Comment.parent_comments @songtag
    @comment_form = Comment.new
    @comment_log = CommentLog.new
  end
  
  def paging
    @page = params[:songtag][:page]
    
    if @page.to_i < 2
      @page = 2
    end
    
    @category = nil
    if !params[:songtag][:category] == ""
      @category = params[:songtag][:category]
    end
    
    @songtags = fetch_songtags(@category, @page)
    
    @is_last = false
    if @songtags.total_pages <= @songtags.current_page
      @next_page = @page
      @is_last = true
    else
      @next_page = @page.to_i + 1
    end
    
    respond_to do |format|
      format.js
    end
  end
  
end
