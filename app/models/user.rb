class User < ActiveRecord::Base
  MAX_BIO_LENGTH = 140
  has_many :photos

  validates :bio, length: { maximum: MAX_BIO_LENGTH }
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :password_digest, presence: true
  validates :username, uniqueness: { case_sensitive: false, allow_blank: true }
end
