class CallbacksController < Devise::OmniauthCallbacksController
  def spotify
      @user = User.from_omniauth(request.env["omniauth.auth"])
      spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
      hash = spotify_user.to_hash
      rspotify_hash_json = hash.to_json
      @user.rspotify_hash = rspotify_hash_json
      @user.save!
      sign_in_and_redirect @user
  end
end