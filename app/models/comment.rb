class Comment < ActiveRecord::Base
  attr_accessible :context, :songtag_id, :uid, :parent_cmt_id
  validates :context, presence:true,
                      length: {minimum: 1 } 
  
  belongs_to :users
  has_one :user, foreign_key: "id", primary_key:"uid"

  has_one :songtag, foreign_key: "id", primary_key: "songtag_id"
  belongs_to :songtag
  
  has_many :re_comments, foreign_key: "parent_cmt_id", class_name: "Comment"
  has_one :parent_cmt, primary_key: "parent_cmt_id", foreign_key:"id", class_name: "Comment"

  has_many :comment_logs, foreign_key: "comment_id"
end
