class Feedback < ActiveRecord::Base
  attr_accessible :uid, :text
  validates :text,  presence:true,
                    length: {minimum: 1}
 
  belongs_to :user
  has_one :user, foreign_key: "id", primary_key: "uid"
end
