class SearchController < ApplicationController
  def index
    @songtags = Songtag.search params[:search]
    @songs = Song.search params[:search]
  end
end
