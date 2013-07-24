class SongtagsController < ApplicationController
  def show
    @songtag = Songtag.find(params[:id])

    # vote에 따라 소팅 필요
    @songs = sort_songs @songtag.songs

    # 날자순으로 소팅
    @comments = Comment.parent_comments @songtag
    
    @comment_form = Comment.new
    @comment_log = CommentLog.new

    @current_song = @songs[0]

    if !params[:songtag_id].nil?
      @songs.each do |s|
        if s.id == params[:songtag_id].to_i
          @current_song = s
        end
      end
    end
  end

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
  
  private
  
  def sort_songs(songs)
    songs.sort_by{|song| -song.votes.count}
  end
end
