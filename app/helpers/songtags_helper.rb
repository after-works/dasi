module SongtagsHelper
  def is_original_song? (tag, song)
    tag.original_song_id == song.id
  end
end
