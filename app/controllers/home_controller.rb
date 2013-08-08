class HomeController < ApplicationController
  before_filter :user_only
  include SongtagsHelper
  
  def index
    if signed_in?
      # @hot_issue
      # @recomends
      # @ranking
      # @reandom
      
      @popular_songtags = fetch_songtags(Songtag.popular_songtags_flag, 1)
      @new_songtags = fetch_songtags(Songtag.new_songtags_flag, 1)
    else
      redirect_to signin_path
      return
    end

  end
end
