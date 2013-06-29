class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :uid
      t.integer :songtag_id
      t.text :context

      t.timestamps
    end
  end
end
