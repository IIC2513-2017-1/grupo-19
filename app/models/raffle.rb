class Raffle < ApplicationRecord
  belongs_to :user
  belongs_to :raffle_category
  has_many :prizes
  has_many :numbers
  has_many :winners
  has_many :comments
  has_many :notifications

  validates :name, presence: true,
                   length: { maximum: 127,
                             minimum: 5},
                   uniqueness: {case_sensitive: false}
  validates :description, presence: true,
                          length: { maximum: 255 }
  validates :price, presence: true,
                    numericality: { only_integer: true,
                                    greater_than: 0}
  validates :final_date, presence: true
  validate :final_date_cannot_be_in_the_past

  def final_date_cannot_be_in_the_past
    if final_date.present? && final_date < Date.today
      errors.add(:final_date, "can't be in the past")
    end
  end

  def self.search(search)
    where("name LIKE ? OR description LIKE ? OR price LIKE ? OR id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
