class Post < ApplicationRecord
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 50 }
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likes_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
end
