class SongsController < ApplicationController
  before_filter :user_only
  
  def create
    params[:song][:songs].each do |s|
      song = Song.new
      song.title = s[:title]
      song.tag_id = params[:song][:tag_id]
      song.youtube_id = s[:youtube_id]
      song.uid = params[:song][:uid]
      song.save
    end
    
    @songtag = Songtag.find(params[:song][:tag_id])
    
    redirect_to @songtag
  end

end
