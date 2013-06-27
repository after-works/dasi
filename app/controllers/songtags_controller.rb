class SongtagsController < ApplicationController
  
  def show
    @songtag = Songtag.find(params[:id])
    @songs = @songtag.songs
  end

  def new
    @songtag = Songtag.new
  end

  def edit
    @songtag = Songtag.find(params[:id])
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

  def update
    @songtag = Songtag.find(params[:id])

    if @songtag.update_attributes(params[:songtag])
      format.html { redirect_to @songtag, notice: 'Songtag was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @songtag.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @songtag = Songtag.find(params[:id])
    @songtag.destroy
  end
end
