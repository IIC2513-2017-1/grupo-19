class PriceCategory < ApplicationRecord
  has_many :prices

  validates :name, length: {maximum: 128}, presence: true
  validates :description, length: {maximum: 1024}

end
