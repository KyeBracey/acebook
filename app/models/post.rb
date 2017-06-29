class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  validates :message, presence: true
  belongs_to :user
end
