class Response < ApplicationRecord
  belongs_to :comment
  belongs_to :responded, class_name: "Comment"

  validates :response_id, presence: true
  validates :responded_id, presence: true

  end
