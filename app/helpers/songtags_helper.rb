module SongtagsHelper
  def fetch_songtags(category, page)
    if !category.nil?
      if category == "0"
        return Songtag.paginate(:per_page=>5, :page=>page).
                find(:all, :select => "#{Songtag.table_name}.*, COUNT(#{Vote.table_name}.id) number_of_votes",
                    :joins => "LEFT OUTER JOIN #{Vote.table_name} ON #{Vote.table_name}.songtag_id = #{Songtag.table_name}.id",
                    :order => "number_of_votes desc",
                    :group => "#{Songtag.table_name}.id")
      elsif category == "1"
        return Songtag.paginate(:per_page=>5, :page=>page).
                find(:all, :select => "#{Songtag.table_name}.*, MAX(#{Song.table_name}.updated_at) song_updated_at",
                    :joins => :songs,
                    :order => "song_updated_at desc",
                    :group => "#{Songtag.table_name}.id")
      else
        return Songtag.paginate(:per_page=>5, :page=>page).find(:all)
      end
    end
  end
  
  def get_first_song(songtag)
    return songtag.songs.sort_by{|song| -song.votes.count}[0]
  end
end
