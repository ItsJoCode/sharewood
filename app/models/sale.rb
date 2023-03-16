class Sale < ApplicationRecord
  include PgSearch::Model

  belongs_to :product
  has_many :orders
  has_many :bookmarks
  has_one_attached :photo

  validates :address, :sale_capacity, :end_date, :price_reduction, :progress, presence: true
  enum :progress, { in_progress: 0, confirmed: 1, done: 2, cancel: 3 }

  pg_search_scope :global_search,
    against: %i[address end_date],
    associated_against: {
      product: [:brand]
    },
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.define_markers
    self.geocoded.map do |sale|
      {
        lat: sale.latitude,
        lng: sale.longitude,
        marker_html: '<i class="fa-solid fa-location-dot"></i>'
      }
    end
  end

  def update_sale_status
    rest_value = sale_capacity - current_capacity
    confirmed! if rest_value.fdiv(sale_capacity) < 0.10 && end_date >= Time.now
  end
end
