class RemoveTitleFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :title
  end

  def down
    add_column :songs, :title, :string
  end
end
