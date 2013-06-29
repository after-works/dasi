class CommentLog < ActiveRecord::Base
  attr_accessible :comment_id, :status, :uid
  
  has_one :comment, foreign_key: "id", primary_key: "comment_id"
  belongs_to :comment
  
  has_one :user, foreign_key: "id", primary_key: "uid"
  belongs_to :users
end
