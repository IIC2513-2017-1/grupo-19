class Prize < ApplicationRecord
  belongs_to :prize_category
  belongs_to :raffle

  def self.search(search)
  where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end

end
