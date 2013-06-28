module VotesHelper
  def voted_users (song)
    users = []
    song.votes.each do | v |
      users << v.user
    end
    users.uniq
  end

  def voted? (song)
    users = voted_users(song)
    flag = false
    
    users.each do | u |
      flag = u.id == current_user.id
    end
    
    flag
  end
end
