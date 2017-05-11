class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :raffle_category
  has_many :prices
  has_many :numbers
  has_many :winners
  has_many :comments
  has_many :notifications

  validates :name, length: {maximum: 128}, presence: true
  validates :description, length: {maximum: 1024}, presence: true
  validates :price, numericality: {only_integer: true, greater_than: 0}
end
