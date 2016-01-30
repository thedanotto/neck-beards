class User < ActiveRecord::Base
  has_many :photos

  validates :bio, length: { maximum: 140 }
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :password_digest, presence: true
  validates :username, uniqueness: { case_sensitive: true }

  def self.search(term)
    Rails.logger.warn where(["'username' LIKE ?", "%#{term}%"]).to_sql

    where(["username LIKE ?", "%#{term}%"])
  end
end
