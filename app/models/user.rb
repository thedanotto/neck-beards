class User < ActiveRecord::Base
  has_many :photos

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, uniqueness: { case_sensitive: true }
  validates :bio, length: { maximum: 140 }
end
