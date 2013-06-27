class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :tag_id
      t.string :title
      t.string :singer
      t.text :content

      t.timestamps
    end
  end
end
