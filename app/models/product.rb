class Product < ApplicationRecord
  belongs_to :user
  has_many :sales

  validates :name, :description, :store_price, :reference, :weight, :eco_score, :brand, presence: true
  validates :reference, :name, uniqueness: true
end
