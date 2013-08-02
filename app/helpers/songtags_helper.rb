module SongtagsHelper
  def fetch_popular_songtags()
#    return Songtag.all(:select => "#{Songtag.table_name}.*, COUNT(#{Vote.table_name}.id) number_of_votes",
#                :joins => :votes,
#                :order => "number_of_votes desc")
    return Songtag.all.sort_by{|songtag| -songtag.votes.count}
  end
  
  def fetch_new_songtags()
    return Songtag.all.sort{|a,b| get_song_updated_date(b) <=> get_song_updated_date(a)}
    #songs = Song.all(:select => "DISTINCT #{Song.table_name}.tag_id, #{Song.table_name}.updated_at", :order => "updated_at desc")
  end
  
  def get_song_updated_date(songtag)
    return songtag.songs.sort_by{|song| -song.updated_at.to_i}[0].updated_at.to_i
  end
end
