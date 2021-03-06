class Vote < ActiveRecord::Base
  attr_accessible :song_id, :songtag_id, :uid
  
  belongs_to :users
  belongs_to :sontags
  belongs_to :songs
  
  has_one :user, foreign_key: "id", primary_key: "uid"
  has_one :songtag, foreign_key: "id", primary_key: "songtag_id"
  has_one :song, foreign_key: "id", primary_key: "song_id"
  
    class << self 
    def at_detail
      @at_detail = 0
    end

    def at_list
      @at_list = 1
    end
  end
end
