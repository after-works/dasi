class Songtag < ActiveRecord::Base
  attr_accessible :contents, :original_song_id, :title
  
  has_many :songs, foreign_key: "tag_id", dependent: :destroy
  belongs_to :songtags
end
