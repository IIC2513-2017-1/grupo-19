class Number < ApplicationRecord
  belongs_to :raffle
  belongs_to :user
  has_one :purchase
  has_one :winner

  validates :number, presence: true,
                     numericality: { integer_only: true,
                                     greater_than: 0}
end
