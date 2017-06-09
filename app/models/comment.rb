class Comment < ApplicationRecord
  belongs_to :user


  has_one :answered_relationship, foreign_key: :response_id,
                                  class_name: 'Response',
                                  dependent: :destroy
  has_many :answer_relationships, foreign_key: :responded_id,
                                  class_name: 'Response',
                                  dependent: :destroy


  has_one :answered, through: :answered_relationship,
                     source: :answered
  has_many :answers, through: :answer_relationships,
                     source: :answer

  validates :content, length: {maximum: 1024}
end
