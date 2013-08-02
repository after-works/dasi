class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.save
    redirect_to root_path
  end
end
