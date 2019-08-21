class Post < ApplicationRecord

  belongs_to :user

  mount_uploader :image_post, AvatarUploader

end
