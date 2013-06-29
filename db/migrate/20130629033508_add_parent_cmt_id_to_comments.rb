class AddParentCmtIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :parent_cmt_id, :integer
  end
end
