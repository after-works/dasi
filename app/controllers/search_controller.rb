class SearchController < ApplicationController
  def index
    @search_term = params[:search]
    @songtags = Songtag.search @search_term
    @songs = Song.search @search_term
  end
end
