class Comment < ActiveRecord::Base
  attr_accessible :context, :songtag_id, :uid, :parent_cmt_id
  
  belongs_to :users
  has_one :user, foreign_key: "id", primary_key:"uid"

  has_one :songtag, foreign_key: "id", primary_key: "songtag_id"
  belongs_to :songtag
  
  has_many :re_comments, foreign_key: "parent_cmt_id", class_name: "Comment"
  
  def self.parent_comments (songtag)
    songtag.comments.find(:all, :conditions=>"parent_cmt_id is null")
  end
end
