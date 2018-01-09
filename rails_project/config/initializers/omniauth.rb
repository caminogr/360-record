require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"], scope: 'user-modify-playback-state playlist-read-private user-follow-modify'
end
