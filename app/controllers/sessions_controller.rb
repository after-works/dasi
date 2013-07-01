class SessionsController < ApplicationController
  def new
    render layout: false
  end
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    cookies.permanent[:remember_token] = user.remember_token
    redirect_to root_url
  end
  
  def destroy
    cookies.permanent[:remember_token] = nil
    redirect_to root_url
  end
end
