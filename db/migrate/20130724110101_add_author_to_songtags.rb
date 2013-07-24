class AddAuthorToSongtags < ActiveRecord::Migration
  def change
    add_column :songtags, :author, :string
  end
end
