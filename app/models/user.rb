class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLE = { customer: 0, owner: 1 }

  has_many :products
  has_many :orders
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address

  validates :first_name, :last_name, :email, :password, :role, :address, presence: true
  validates_uniqueness_of :first_name, scope: :last_name
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }

  enum :role, ROLE

  after_validation :geocode, if: :will_save_change_to_address?

  def near_sales
    Sale.where(product_id: self.products).near(self, 30)
  end

  # def customer?
  #   self.role == 'customer'
  # end

  # def owner?
  #   self.role == 'owner'
  # end

  def near_markers
    markers = self.near_sales.geocoded.map do |sale|
      {
        lat: sale.latitude,
        lng: sale.longitude,
        marker_html: '<i class="fa-solid fa-location-dot"></i>'
      }
    end
    # current_user marker
    markers.unshift(
      {
        lat: self.latitude,
        lng: self.longitude,
        marker_html: '<i class="fa-solid fa-house-user"></i>'
      }
    )
    markers
  end
end
