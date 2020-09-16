class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
  has_many :tag_posts, dependent: :delete_all
  has_many :tags, through: :tag_posts
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  validates :content, presence: true
  validates :user_id, presence: true
  #DBへのコミット直前に実行
  after_create do
    #1.controller側でcreateしたTweetを取得
    post = Post.find_by(id: self.id)
    #2.正規表現を用いて、Tweetのtext内から『#○○○』の文字列を検出
    tags  = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    #3.mapメソッドでtags配列の要素一つ一つを取り出して、先頭の#を取り除いてDBへ保存する
    tags.uniq.map do |t|
      tag = Tag.find_or_create_by(name: t.downcase.delete('#'))
      post.tags << tag
    end
  end
end