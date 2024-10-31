class OrdersController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])

    # Create an order with the selected print type and dimensions
    order = Order.new(
      photo: @photo,
      print_type: params[:order][:print_type],
      size: params[:order][:size],
      # Add other order details as needed
    )

    if order.save
      redirect_to photo_path(@photo), notice: "Order created successfully!"
    else
      redirect_to photo_path(@photo), alert: "There was an issue creating your order."
    end
  end
end
