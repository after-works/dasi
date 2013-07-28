module CommentLogsHelper
  def cmt_likes (cmt)
    cmt.comment_logs.find(:all, :conditions=>"status = 1")
  end

  def cmt_dislikes (cmt)
    cmt.comment_logs.find(:all, :conditions=>"status = -1")
  end

  def cmt_status_users ( cmt )
    users = []
    cmt.comment_logs.each do | l |
      users << l.user
    end
    users.uniq
  end

  #(좋아요, 싫어요)를 눌렀냐?
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
  
  #좋아요 log인가
  def done_like? ( log )
    if log.nil?
      return false
    end
    
    log.status == 1
  end
  
  # 싫어요 log인가
  def done_dislike? ( log )
    if log.nil?
      return false
    end
    
    log.status == -1
  end
end
