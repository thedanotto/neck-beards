class PhotosController < ApplicationController
  before_filter :require_login

  def show
    @photo = find_photo
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = build_photo
    @photo.user = current_user
    if @photo.save
      flash[:notice] = "Successfully added new photo"
      redirect_to photo_path(@photo)
    else
      flash[:error] = "Please check for errors"
      render :new
    end
  end

  private

  def find_photo
    Photo.find(params[:id])
  end

  def build_photo
    Photo.new(photo_params)
  end

  def photo_params
    params.require(:photo).permit(:url, :caption)
  end
end