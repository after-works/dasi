class FriendsRelation < ActiveRecord::Base
  attr_accessible :a_uid, :b_uid
  
  belongs_to :friends, primary_key: "id", foreign_key: "b_uid", class_name: "User"
  
  validates_uniqueness_of :a_uid, :scope => [:b_uid]
end
