class VotesController < ApplicationController
  before_filter :user_only
  def create
    @song = Song.find_by_id params[:vote][:song_id]
    @songtag = @song.songtag
    @user = current_user

    if voted?(@songtag)
      redirect_to @songtag
    return
    end

    @vote = Vote.new
    @vote.uid = @user.id
    @vote.song_id = @song.id
    @vote.songtag_id = @songtag.id

    @vote.save

    redirect_to @songtag
  end

  def destroy

    @songtag = Songtag.find(params[:id])
    @songtag.destroy
  end
end
