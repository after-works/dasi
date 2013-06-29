class CreateCommentLogs < ActiveRecord::Migration
  def change
    create_table :comment_logs do |t|
      t.integer :uid
      t.integer :comment_id
      t.integer :status

      t.timestamps
    end
  end
end
