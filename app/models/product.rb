class Product < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_one_attached :photo

  validates :name, :description, :store_price, :qr_code, :weight, :eco_score, :brand, presence: true
  validates :qr_code, :name, uniqueness: true
end
