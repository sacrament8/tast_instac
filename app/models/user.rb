class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :posts
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :likes, dependent: :destroy
  has_many :likes_posts, through: :likes, source: :post
  mount_uploader :image, ImageUploader
end