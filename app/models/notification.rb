class Notification < ApplicationRecord
  belongs_to :sender, class_name: "Raffle";
  belongs_to :recipient, class_name: "User"
end
