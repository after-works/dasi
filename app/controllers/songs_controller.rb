class SongsController < ApplicationController
  before_filter :user_only
  
  def create
    @song = Song.new(params[:song])

    @song.save
    
    redirect_to @song.songtag
  end

end
