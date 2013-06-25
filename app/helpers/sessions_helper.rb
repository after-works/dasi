module SessionsHelper
  def signed_in?
    !current_user.nil?
  end
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  def admin?
    if signed_in?
      if @current_user.admin ==0
        return false
      else
        return true
      end
    end
    return false
  end
end
