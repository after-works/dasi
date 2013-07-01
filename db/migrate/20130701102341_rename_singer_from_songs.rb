class RenameSingerFromSongs < ActiveRecord::Migration
  def up
    rename_column :songs, :singer, :title
  end

  def down
    rename_column :songs, :title, :singer
  end
end
