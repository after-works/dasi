class DbSchemaRefactoring < ActiveRecord::Migration
  def up
    rename_column :users, :uid, :fb_uid
    rename_column :songtags, :author, :uid
    change_column :songtags, :uid, :integer
  end

  def down
    rename_column :users, :fb_uid, :uid
    rename_column :songtags, :uid, :author
    change_column :songtags, :author, :string
  end
end
