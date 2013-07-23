module CommentsHelper
  def has_recmt? (cmt)
    !cmt.re_comments.nil?
  end
end
