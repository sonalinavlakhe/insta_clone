class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :account
  default_scope {order created_at: :desc}

  scope :active, -> {where active: true}

  def total_likes
    0
  end
end
