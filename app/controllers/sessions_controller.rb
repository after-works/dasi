class SessionsController < ApplicationController
  
  def new
    render layout: false
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    cookies.permanent[:remember_token] = user.remember_token

    if cookies[:recent_url].nil?
      redirect_to root_url
    else
      redirect_to cookies[:recent_url]
      cookies[:recent_url] = nil
    end

  end

  def destroy
    cookies.permanent[:remember_token] = nil
    redirect_to root_url
  end
end
