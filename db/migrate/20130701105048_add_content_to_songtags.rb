class AddContentToSongtags < ActiveRecord::Migration
  def change
    add_column :songtags, :content, :text
  end
end
