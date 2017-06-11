class Relationship < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: "User"
  belongs_to :followed, foreign_key: 'followed_id', class_name: "User"

  validates :follower_id, uniqueness: { scope: :followed_id,
                                        message: "Already following."}
  validates :followed_id, uniqueness: { scope: :follower_id,
                                        message: "Already followed."}
end
