class RenameFieldFeedback < ActiveRecord::Migration
  def up
    rename_column :feedbacks, :uid_id, :uid
    change_column :feedbacks, :uid, :integer
  end

  def down
    rename_column :feedbacks, :uid, :uid_id
    change_column :feedbacks, :uid, :references
  end
end
