class PhotosController < ApplicationController

  def index
    @photos = Photo.where(active: true).order(:position)
  end

  def show
    @photo = Photo.find(params[:id])
    @sizes = @photo.calculate_sizes
  end
end
