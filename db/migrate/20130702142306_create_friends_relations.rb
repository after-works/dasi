class CreateFriendsRelations < ActiveRecord::Migration
  def change
    create_table :friends_relations do |t|
      t.integer :a_uid
      t.integer :b_uid

      t.timestamps
    end
  end
end
