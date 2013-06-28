class Songtag < ActiveRecord::Base
  attr_accessible :contents, :original_song_id, :title

  has_many :songs, foreign_key: "tag_id", dependent: :destroy
  has_many :votes, foreign_key: "songtag_id", dependent: :destroy

  belongs_to :song
  belongs_to :vote
end
