class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :uid
      t.text :text

      t.timestamps
    end
    add_index :feedbacks, :uid_id
  end
end
