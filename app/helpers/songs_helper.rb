module SongsHelper
  def youtube_video(song)
    "<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/#{song.youtube_id}\" frameborder=\"0\" allowfullscreen></iframe>"
  end
  
  def youtube_thumb(song)
    "http://img.youtube.com/vi/#{song.youtube_id}/0.jpg"
  end
  
  def sort_songs(songs)
    songs.sort_by{|song| -song.votes.count}
  end

end
