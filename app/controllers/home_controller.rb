class HomeController < ApplicationController
  def index
    @debug = session[:remember_token]
  end
end
