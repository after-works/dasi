module VotesHelper
  def voted_users (song)
    users = []
    song.votes.each do | v |
      users << v.user
    end
    users.uniq
  end

  def voted? (song)
    if !signed_in?
    return false
    end

    users = voted_users(song)
    flag = false

    users.each do | u |
      flag = u.id == current_user.id
    end

    flag
  end

  def render_vote_form(song, page_flag)
    render(partial: 'votes/form', locals: {song: song, page_flag: page_flag})
  end
end
