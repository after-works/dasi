OmniAuth.config.logger = Rails.logger

ENV['FACEBOOK_APP_ID'] = "189320791228733"
ENV['FACEBOOK_SECRET'] = "6954df39a979b956b3bb2a7ac885cc15"

require "omniauth-facebook"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], 
    {:scope => "publish_actions,publish_stream,share_item", :client_options => {:ssl => {:verify => false}}}
end
