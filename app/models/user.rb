class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLE = { customer: 0, owner: 1 }

  has_many :products
  has_many :sales, through: :products
  has_many :orders
  has_many :sales, through: :orders
  has_many :bookmarks
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
    if self.owner?
      Sale.where(product_id: self.products).near(self, 30)
    elsif self.customer?
      # Sale.all.near(self, 20)
      Sale.where(progress: :in_progress).near(self, 20)
    end
  end

  def near_sales_for(sales)
    if self.owner?
      #Sale.where(product_id: self.products).near(self, 30)
    elsif self.customer?
      # Sale.all.near(self, 20)
     sales.in_progress.near(self, 20)
    end
  end

  def near_markers_for(my_sales)
    markers = my_sales.define_markers
    markers.unshift(
      {
        lat: self.latitude,
        lng: self.longitude,
        marker_html: '<i class="fa-solid fa-house-user"></i>'
      }
    )
    markers
  end

  def product_sales
    sales = []
    products.each { |product| sales << product.sales }
    sales.flatten
  end

  def bookmark_for(sale)
    self.bookmarks.find_by(sale:)
  end
end
