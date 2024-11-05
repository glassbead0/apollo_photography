# app/controllers/admin/photos_controller.rb
module Admin
  class PhotosController < ApplicationController
    before_action :set_photo, only: [:edit, :update, :destroy]

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

    def index
      @photos = Photo.order(:position) # Order by position for drag-and-drop sorting
    end

    def edit
    end

    def update
      if @photo.update(photo_params)
        redirect_to admin_photos_path, notice: 'Photo updated successfully.'
      else
        render :edit
      end
    end

    def destroy
      @photo.destroy
      redirect_to admin_photos_path, notice: 'Photo deleted successfully.'
    end

    # Update photo positions after sorting
    def sort
      params[:photo].each_with_index do |id, index|
        Photo.where(id: id).update_all(position: index + 1)
      end
      head :ok
    end

    private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:title, :description, :base_price, :active, :image)
    end
  end
end
