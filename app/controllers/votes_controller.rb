class VotesController < ApplicationController
  before_filter :user_only
  
  include SongsHelper


  def create
    @song = Song.find_by_id params[:vote][:song_id]
    @songtag = @song.songtag
    user = current_user

    if voted?(@songtag)
      old_vote = Vote.find(:all, :conditions=>"uid=#{user.id} and songtag_id=#{@songtag.id}")
      
      logger.debug old_vote
      
      if !old_vote.nil?
        old_vote.each do |v|
          v.destroy
        end
      end
    end

    vote = Vote.new
    
    vote.uid = user.id
    vote.song_id = @song.id
    vote.songtag_id = @songtag.id

    vote.save

    #redirect_to @songtag
    
    @songs = sort_songs(@songtag.songs)
    
    @at_list = params[:vote][:at_list]
    
    respond_to do |format|
      format.js
    end
  end

  def destroy

    @songtag = Songtag.find(params[:id])
    @songtag.destroy
  end
end
