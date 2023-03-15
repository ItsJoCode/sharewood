class Notification < ApplicationRecord
  belongs_to :sale

  validates :content, presence: true
  validates :sale_id, presence: true

end
