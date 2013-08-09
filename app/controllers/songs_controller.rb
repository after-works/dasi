class SongsController < ApplicationController
  before_filter :user_only
  
  def create
    @songtag = Songtag.find(params[:song][:tag_id])
    
    if @songtag.songs.count >= 15
      #need some alert message
      redirect_to @songtag
    else
      params[:song][:songs].each do |s|
        puts s
        song = Song.new
        song.title = s[:title]
        song.tag_id = params[:song][:tag_id]
        song.youtube_id = s[:youtube_id]
        song.uid = params[:song][:uid]
        song.save
      end
      
      redirect_to @songtag
    end
    
    
  end

end
