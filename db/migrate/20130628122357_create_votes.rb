class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :uid
      t.integer :songtag_id
      t.integer :song_id

      t.timestamps
    end
  end
end
