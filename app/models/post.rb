class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :account
  has_many :likes
  has_many :comments
  
  default_scope {order created_at: :desc}

  scope :active, -> {where active: true}
end
