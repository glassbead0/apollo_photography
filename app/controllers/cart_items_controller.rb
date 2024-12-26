class CartItemsController < ApplicationController
  def create
    photo_id = params[:photo_id]
    session[:cart] << photo_id unless session[:cart].include?(photo_id)
    redirect_back fallback_location: root_path, notice: 'Added to cart!'
  end
  
  def destroy
    session[:cart].delete(params[:id])
    redirect_back fallback_location: root_path, notice: 'Removed from cart!'
  end
end 