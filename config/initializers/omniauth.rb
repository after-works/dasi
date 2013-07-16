OmniAuth.config.logger = Rails.logger

ENV['FACEBOOK_APP_ID'] = "189320791228733"
ENV['FACEBOOK_SECRET'] =  "e53928ea46af09f70b7aeac76409bc77"

require "omniauth-facebook"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {:scope => "publish_actions", :client_options => {:ssl => {:verify => false}}}
end
