module CommentLogsHelper
  def like (cmt)
    cmt.comment_logs.find(:all, :conditions=>"status = 1")
  end

  def dislike (cmt)
    cmt.comment_logs.find(:all, :conditions=>"status = -1")
  end

  def cmt_status_users ( cmt )
    users = []
    cmt.comment_logs.each do | l |
      users << l.user
    end
    users.uniq
  end

  def status? ( cmt )
    if !signed_in?
    return false
    end

    users = cmt_status_users(cmt)
    flag = false

    users.each do | u |
      flag = u.id == current_user.id
    end

    flag
  end

  def my_status_choice (cmt)
    if !signed_in?
      return nil
    end

    cmt.comment_logs.each do |l|
      if l.uid == current_user.id
        return l
      end
    end
    
    return nil
  end
  
end