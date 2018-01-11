class PhotosController < ApplicationController
  def index
    @photo = Photo.new
    @photos = Photo.order("created_at DESC")
  end
  
  def create
    if params[:photo]
      @photo = Cloudinary::Uploader.upload(params[:photo], use_filename: true)
      @photo = current_user.photos.create(public_id: @photo['public_id'])
    end

    redirect_to root_path
  end
end
