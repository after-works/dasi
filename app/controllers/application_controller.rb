class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper
  include VotesHelper
  include CommentLogsHelper
end
