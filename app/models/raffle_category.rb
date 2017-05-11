class RaffleCategory < ApplicationRecord
  has_many :raffles

  validates :name, length: {maximum: 128}, presence: true
  validates :description, length: {maximum: 1024}
end
