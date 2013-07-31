module UserHelper
  def get_user_with_uid(uid)
    User.find(uid)
  end
end