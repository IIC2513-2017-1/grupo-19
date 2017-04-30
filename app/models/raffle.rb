class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :raffle_categorie
  has_many :prices
end
