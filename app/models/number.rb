class Number < ApplicationRecord
  belongs_to :raffle
  belongs_to :user
  has_one :purchase
  has_one :winner
end
