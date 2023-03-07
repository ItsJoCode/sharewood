class Sale < ApplicationRecord
  belongs_to :product
  has_many :orders

  validates :address, :sale_capacity, :end_date, :price_reduction, :progress, presence: true
  enum :progress, { in_progress: 0, confirmed: 1, done: 2, cancel: 3 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
