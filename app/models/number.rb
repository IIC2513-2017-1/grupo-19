class Number < ApplicationRecord
  belongs_to :raffle
  has_one :purchase
  has_one :winner
end
