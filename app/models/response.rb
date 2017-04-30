class Response < ApplicationRecord
  belongs_to :answer, foreign_key: 'response_id', class_name: 'Comment'
  belongs_to :answered, foreign_key: 'responded_id', class_name: 'Comment'
end
