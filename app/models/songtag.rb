class Songtag < ActiveRecord::Base
  attr_accessible :content, :title, :uid
  validates :title, presence:true,
                    length: {minimum: 1}

  has_many :songs, foreign_key: "tag_id", dependent: :destroy
  belongs_to :song
  
  has_many :votes, foreign_key: "songtag_id", dependent: :destroy
  belongs_to :vote
  
  has_many :comments, foreign_key: "songtag_id", dependent: :destroy
  belongs_to :comment
  
  belongs_to :user
  has_one :user, foreign_key: "id", primary_key: "uid"
  
end
