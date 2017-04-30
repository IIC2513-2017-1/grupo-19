class Message < ApplicationRecord
  belongs_to :sender, class_name: "User";
  belongs_to :recipient, class_name: "User"

  has_many :message_responses
end
