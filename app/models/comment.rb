class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :raffle

  has_many :responses, dependent: :destroy
  has_one :responded, :class_name => "Response", :foreign_key => "responded_id"
  has_one :comment_responded, :trough => :responded, :source => :comment
end
