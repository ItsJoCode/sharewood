class Order < ApplicationRecord
  belongs_to :sale
  belongs_to :user

  validates :capacity, presence: true
end
