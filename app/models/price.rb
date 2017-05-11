class Price < ApplicationRecord
  belongs_to :price_category
  belongs_to :raffle
  has_one :winner

  validates :name, length: {maximum: 128}, presence: true
  validates :description, length: {maximum: 1024}


end
