class User < ApplicationRecord
  # Relationships
  has_many :raffles, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :numbers, dependent: :destroy

  has_many :messages_sent, foreign_key: 'sender_id',
                           class_name:  'Message'
  has_many :messages_received, foreign_key: 'recipient_id',
                               class_name:  'Message'



  has_many :notifications, dependent: :destroy

  has_many :follower_relationships, foreign_key: "followed_id",
                                    class_name:  "Relationship",
                                    dependent:   :destroy

  has_many :following_relationships, foreign_key: "follower_id",
                                     class_name:  "Relationship",
                                     dependent:   :destroy

  has_many :followers, through: :follower_relationships,
                       source:  :follower

  has_many :followings, through: :following_relationships,
                        source:  :followed

  validates :name, presence: true,
                   length: { maximum: 50 }

  has_many :followings_users, class_name: "User", through: "following_relationships"
  has_many :follower_users, class_name: "User", through: "following_relationships"


  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 6 },
                       allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.search(search)
  where("name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
  end
end
