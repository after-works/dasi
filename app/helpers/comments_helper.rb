module CommentsHelper
  def has_recmt? (cmt)
    !cmt.re_comments.nil?
  end

  def trunc_cmt ( cmt )
  	truncate cmt, :length => 150
  end

  def trunc_recmt ( cmt )
  	truncate cmt, :length => 130
  end
end
