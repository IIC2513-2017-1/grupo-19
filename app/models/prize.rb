class Prize < ApplicationRecord
  belongs_to :prize_category
  belongs_to :raffle

  has_attached_file :avatar, styles: { medium: "300x300#>", thumb: "100x100#>" }, default_url: "/images/prize1.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.search(search)
  where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end

end
