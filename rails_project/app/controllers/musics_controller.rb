class MusicsController < ApplicationController
  before_action :set_photos, only: [:play, :pause]

  def play
    auth_hash = User.find(current_user.id).auth_hash
    spotify_user = RSpotify::User.new(auth_hash)
    # own_playlist = spotify_user.playlists.sample
    # own_playlist = RSpotify::Playlist.find(spotify_user.id, "2RGLjgjEFGAjeKVc4rgxpv")
    # own_track    = own_playlist.tracks.sample

    # artist (utada)
    artist = RSpotify::Artist.find('4DSxehI0uXFMd7gjfcbt44')
    own_track = artist.albums.sample.tracks.sample
    spotify_user.play_track(own_track.uri)

    render template: "photos/index"
  end

  def pause
    auth_hash = User.find(current_user.id).auth_hash
    spotify_user = RSpotify::User.new(auth_hash)
    spotify_user.pause_track

    render template: "photos/index"
  end

  private
  def set_photos
    @photo = Photo.new
    @photos = Photo.order("created_at DESC")
  end
end
