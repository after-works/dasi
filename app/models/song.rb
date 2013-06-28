class Song < ActiveRecord::Base
  belongs_to :songtag
  has_one :songtag, foreign_key: "id", primary_key:"tag_id"
  
  belongs_to :vote
  has_many :votes, foreign_key: "song_id"
  
  attr_accessible :content, :singer, :tag_id, :youtube_id
end
