class Notification < ApplicationRecord
  belongs_to :sale
  has_one :product, through: :sale
  has_one :user, through: :product

  validates :content, presence: true
  validates :sale_id, presence: true

end
