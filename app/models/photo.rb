class Photo < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true
end
