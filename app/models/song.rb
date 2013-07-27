class Song < ActiveRecord::Base
  attr_accessible :title, :tag_id, :youtube_id
  
  belongs_to :songtag
  has_one :songtag, foreign_key: "id", primary_key:"tag_id"
  
  belongs_to :vote
  has_many :votes, foreign_key: "song_id"
  
end
