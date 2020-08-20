class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image, ImageUploader

  has_many :messages
  has_many :comments
  has_many :room_users
  has_many :rooms, through: :room_users, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :follows, foreign_key: 'follower_id'
  # フォローしているuser(followingという架空モデル)
  has_many :followings, through: :follows, source: :following
  # (reverse_of_followsという架空モデル)
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'following_id'
  # フォローされているuser(followerという架空モデル)
  has_many :followers, through: :reverse_of_follows, source: :follower

  # フォローが自分自身ではないか？
  def following(other_user)
    unless self == other_user
      self.follows.find_or_create_by(following_id: other_user.id)
    end
  end

  # フォローがあればアンフォローする
  def unfollow(other_user)
    follow = self.follows.find_by(following_id: other_user.id)
    follow.destroy if follow
  end

  # すでにフォローしていないか？
  def following?(other_user)
    self.followings.include?(other_user)
  end

  # # ====================自分がフォローしているユーザーとの関連 ===================================
  # #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  # has_many :active_follows, class_name: "Follow", foreign_key: :following_id
  # # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「following」と定義
  # has_many :followings, through: :active_follows, source: :follower
  # # ========================================================================================

  # # ====================自分がフォローされるユーザーとの関連 ===================================
  # #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  # has_many :passive_follows, class_name: "Follow", foreign_key: :follower_id
  # # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「follower」と定義
  # has_many :followers, through: :passive_follows, source: :following
  # # =======================================================================================

  # def followed_by?(user)
  #   # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
  #   passive_follows.find_by(following_id: user.id).present?
  # end

  validates :password, confirmation: true
  devise :validatable, password_length: 6..128
  validates :username,    presence: true, uniqueness: true
  validates :nickname,    presence: true
  validates :email,       presence: true
end