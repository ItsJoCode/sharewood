class Review < ApplicationRecord
  belongs_to :order

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :order_id, presence: true
end
