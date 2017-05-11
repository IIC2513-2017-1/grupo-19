class Message < ApplicationRecord
  belongs_to :sender, foreign_key: 'sender_id', class_name: "User";
  belongs_to :recipient, foreign_key: 'recipient_id', class_name: "User"

  has_many :message_responses, foreign_key: 'message_responded_id',
                               class_name: 'MessageResponse'
  has_one :message_responded, foreign_key: 'message_responses_id',
                               class_name: 'MessageResponse'

  validates :content, length: {maximum: 1024}, allow_blank: false
  validates :subject, length: {maximum: 64}
end
