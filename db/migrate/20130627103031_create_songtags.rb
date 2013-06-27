class CreateSongtags < ActiveRecord::Migration
  def change
    create_table :songtags do |t|
      t.string :title
      t.text :contents
      t.integer :original_song_id

      t.timestamps
    end
  end
end
