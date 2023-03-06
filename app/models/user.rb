class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products

  validates :first_name, :last_name, :email, :password, :role, :address, presence: true
  validates_uniqueness_of :first_name, scope: :last_name
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { customer: 0, owner: 1 }
end
