class Price < ApplicationRecord
  belongs_to :price_category
  belongs_to :raffle
end
