class Post < ApplicationRecord
  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 50 }
  belongs_to :user
  mount_uploader :image, ImageUploader
end
