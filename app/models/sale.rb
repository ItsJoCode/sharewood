class Sale < ApplicationRecord
  belongs_to :product

  validates :address, :sale_capacity, :end_date, :price_reduction, :progress, presence: true
  enum :progress, { in_progress: 0, confirmed: 1, done: 2, cancel: 3 }
end
