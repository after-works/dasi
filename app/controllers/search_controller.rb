class SearchController < ApplicationController
  def index
    @songtags = Songtag.search params[:search]
  end
end
