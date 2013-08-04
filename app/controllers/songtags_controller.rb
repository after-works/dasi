class SongtagsController < ApplicationController
  before_filter :user_only
  include SongsHelper
  
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
    @songtag = Songtag.new(params[:songtag])

    @origin_song = Song.new

    @origin_song.content = params[:info][:content]
    @origin_song.youtube_id = params[:info][:youtube_id]
    @origin_song.singer = params[:info][:original_singer]
    @origin_song.save

    @songtag.original_song_id = @origin_song.id
    @songtag.save

    @origin_song.update_attributes(:tag_id=>@songtag.id)

  end

  def index
    @songtags = Songtag.all
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
  
end
