class RemoveOriginalSongFromSongtag < ActiveRecord::Migration
  def up
    remove_column :songtags, :original_song_id
  end

  def down
    add_column :songtags, :original_song_id, :int
  end
end
