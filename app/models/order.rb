class Order < ApplicationRecord
  belongs_to :sale
  belongs_to :user
  has_one :review

  validates :capacity, presence: true
end
