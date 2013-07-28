class User < ActiveRecord::Base
  attr_accessible :name, :uid
  
  has_many :votes, foreign_key: "uid", dependent: :destroy
  
  has_many :comments, foreign_key: "uid", dependent: :destroy
  belongs_to :comment
  
  has_many :comment_logs, foreign_key: "uid", dependent: :destroy
  belongs_to :comment_log
  
  has_many :friends_rel, foreign_key: "a_uid", class_name: "FriendsRelation", dependent: :destroy
  has_many :friends, through: :friends_rel
  
  has_many :songs, foreign_key: "uid", dependent: :destroy
  belongs_to :song
  
  
  before_save :create_remember_token
  
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
      
      fb_user = FbGraph::User.fetch user.uid, :access_token=>user.oauth_token
      friends = fb_user.friends
      
      friends.each do |f|
        u = User.find_by_uid f.identifier
        if u
          r1 = FriendsRelation.new
          r2 = FriendsRelation.new
          
          r1.a_uid = user.id
          r1.b_uid = u.id
          
          r2.a_uid = u.id
          r2.b_uid = user.id
          
          r1.save
          r2.save
        end
      end
    end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end