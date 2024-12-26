class PhotosController < ApplicationController

  def index
    @photos = Photo.where(active: true).order(:position)
    @photo = Photo.all.sample
  end

  def show
    @photo = Photo.find(params[:id])
    @sizes = @photo.calculate_sizes
  end
end
