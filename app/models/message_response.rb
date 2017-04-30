class MessageResponse < ApplicationRecord
  belongs_to :message_response, foreign_key: 'message_response_id',
                                class_name: 'Message'
  belongs_to :message_responded, foreign_key: 'message_responded_id',
                                 class_name: 'Message'
end
