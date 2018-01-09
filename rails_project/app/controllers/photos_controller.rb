class PhotosController < ApplicationController
  def index
    @photo = Photo.new
    @photos = Photo.order("created_at DESC")
  end
  
  def create
    @photo = Cloudinary::Uploader.upload(params[:photo], use_filename: true)
    @photo = current_user.photos.create(public_id: @photo['public_id'])

    redirect_to root_path
  end
end
