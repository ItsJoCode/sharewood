class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLE = { customer: 0, owner: 1 }

  has_many :products

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address

  validates :first_name, :last_name, :email, :password, :role, presence: true
  validates_uniqueness_of :first_name, scope: :last_name
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }

  enum :role, ROLE

  after_validation :geocode, if: :will_save_change_to_address?
end
