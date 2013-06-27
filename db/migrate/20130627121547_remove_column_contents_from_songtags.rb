class RemoveColumnContentsFromSongtags < ActiveRecord::Migration
  def up
    remove_column :songtags, :contents
  end

  def down
    add_column :songtags, :contents, :text
  end
end
