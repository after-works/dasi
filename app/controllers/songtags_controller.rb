class SongtagsController < ApplicationController
  
  def show
    @songtag = Songtag.find(params[:id])
    @songs = @songtag.songs
    @comments = Comment.parent_comments @songtag
    @comment_form = Comment.new
    @comment_log = CommentLog.new
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
end
