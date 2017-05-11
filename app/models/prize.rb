class Prize < ApplicationRecord
  belongs_to: :prize_catefory
  belongs_to: :raffle
end
