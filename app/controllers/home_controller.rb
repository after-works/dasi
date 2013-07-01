class HomeController < ApplicationController
  def index
    if signed_in?
      # @hot_issue
      # @recomends
      # @ranking
      # @reandom
    else
      redirect_to signin_path
      return
    end

  end
end
