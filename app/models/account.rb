class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :posts
  has_many :likes
  has_many :comments

  def full_name
    return "#{first_name} #{last_name}"
  end

  def total_followers
    AccountFollower.where(follower_id: self.id).count
  end

  def total_following
     AccountFollower.where(following_id: self.id).count
  end
end
