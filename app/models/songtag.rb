class Songtag < ActiveRecord::Base
  attr_accessible :content, :title, :author

  has_many :songs, foreign_key: "tag_id", dependent: :destroy
  belongs_to :song
  
  has_many :votes, foreign_key: "songtag_id", dependent: :destroy
  belongs_to :vote
  
  has_many :comments, foreign_key: "songtag_id", dependent: :destroy
  belongs_to :comment
  
end
