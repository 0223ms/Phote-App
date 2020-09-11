class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  validates :content, presence: true
  validates :user_id, presence: true
end