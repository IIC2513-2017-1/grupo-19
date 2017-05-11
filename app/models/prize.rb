class Prize < ApplicationRecord
  belongs_to :prize_category
  belongs_to :raffle
end
