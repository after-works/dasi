class SongsController < ApplicationController
  def create
    @song = Song.new(params[:song])

    @song.save
    
    redirect_to @song.songtag
  end

end
