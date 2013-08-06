class HomeController < ApplicationController
  before_filter :user_only
  include SongtagsHelper
  
  def index
    if signed_in?
      # @hot_issue
      # @recomends
      # @ranking
      # @reandom
      
      @popular_songtags = fetch_songtags("1", 1)
      @new_songtags = fetch_songtags("2", 1)
    else
      redirect_to signin_path
      return
    end

  end
end
