class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @sizes = @photo.calculate_sizes
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path, notice: "Photo successfully uploaded."
    else
      render :new, alert: "Error uploading photo."
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :base_price, :image)
  end
end
