class Song < ActiveRecord::Base
  attr_accessible :title, :tag_id, :youtube_id, :uid
  
  belongs_to :songtag
  has_one :songtag, foreign_key: "id", primary_key:"tag_id"
  
  belongs_to :vote
  has_many :votes, foreign_key: "song_id"
  
  belongs_to :user
  has_one :user, foreign_key: "id", primary_key:"uid"
end
