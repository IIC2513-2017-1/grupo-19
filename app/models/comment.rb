class Comment < ApplicationRecord
  belongs_to :user
  has_one :answered, foreign_key: :response_id,
                     class_name: 'Response'
  has_many :answers, foreign_key: :responded_id,
                    class_name: 'Response'


  validates :content, length: {maximum: 1024}
end
