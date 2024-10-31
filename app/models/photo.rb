class Photo < ApplicationRecord
  has_one_attached :image
  has_many :order_items
  has_many :orders, through: :order_items

  def aspect_ratio
    image.metadata[:width].to_f / @photo.image.metadata[:height].to_f rescue 1.5 # Fallback for typical 3:2 ratio
  end

  def calculate_sizes
    (8..30).step(6).map do |width|
      height = (width / aspect_ratio).round(0)
      { width: width, height: height }
    end
  end

end
