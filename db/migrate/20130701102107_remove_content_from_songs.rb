class RemoveContentFromSongs < ActiveRecord::Migration
  def up
    remove_column :songs, :content
  end

  def down
    add_column :songs, :content, :string
  end
end
