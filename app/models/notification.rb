class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :raffle

  validates :content, length: {maximum: 1024}

end
