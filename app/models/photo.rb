class Photo < ApplicationRecord
  has_one_attached :image
  has_many :order_items
  has_many :orders, through: :order_items
end
