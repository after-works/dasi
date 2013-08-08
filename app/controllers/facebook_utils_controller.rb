class FacebookUtilsController < ApplicationController
  before_filter :user_only
  
  def share_link
    songtag = params[:facebook_util][:songtag_id]
    song = params[:facebook_util][:song_id]
    user = User.find(params[:facebook_util][:user_id].to_i)
    
    me = FbGraph::User.me(user.oauth_token)
 
    link = me.link!(
      :link => request.host_with_port + "songtags/" + songtag + "/" + song,
      :message => "Test"
    )
    
    respond_to do |format|
      format.js
    end
  end
end
