class AddUidToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :uid, :integer
  end
end
