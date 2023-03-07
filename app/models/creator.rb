class Creator < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 10, maximum: 500 }
end
