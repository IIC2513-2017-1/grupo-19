class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :raffle_category
  has_many :prices
  has_many :numbers
end
