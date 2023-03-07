class Order < ApplicationRecord
  belongs_to :sale
  belongs_to :user

  validates :capacity, :total_price, :notify, presence: true
  enum :notify, { no: 0, yes: 1 }
end
