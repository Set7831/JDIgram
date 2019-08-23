class Post < ApplicationRecord

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :image_post, AvatarUploader

end
