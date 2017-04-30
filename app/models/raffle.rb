class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :raffle_category
  has_many :prices
  has_many :numbers
  has_many :winners
  has_many :comments
  has_many :notifications
end
