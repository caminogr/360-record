class MusicsController < ApplicationController
  before_action :set_photos, only: [:play, :pause]

  def play
    auth_hash = User.find(current_user.id).auth_hash
    spotify_user = RSpotify::User.new(auth_hash)
    spotify_user.play_track("spotify:track:2xj9i8PbLxCQtN3cYwSZyF")

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
