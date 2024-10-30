class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :photo

  validates :height, numericality: { greater_than: 5, less_than: 40 }, allow_nil: true
  validates :width, numericality: { greater_than: 7, less_than: 40 }, allow_nil: true
  validates :print_type, inclusion: { in: %w[canvas metal paper] }, allow_nil: true
end
