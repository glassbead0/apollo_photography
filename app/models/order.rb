class Order < ApplicationRecord
  has_many :order_items
  has_many :photos, through: :order_items
end
