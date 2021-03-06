![PhotoTop](https://i.gyazo.com/a61c09f264138fe5fa59f06fd11a2406.jpg)

<h1 align="center">Photo</h1>

<p align="center"><br>
  <b><a>- member -</a></b><br><br>
  <b><a><a href="https://github.com/0223ms"><img src="https://avatars3.githubusercontent.com/u/59785847?s=460&v=4" width="70px;" /></a></b>
  <b><a><a href="https://github.com/akkun016"><img src="https://avatars1.githubusercontent.com/u/59810344?s=460&v=4" width="70px;" /></a></b>
</p><br>

## 制作背景

<p>今や多くの人が使用し、楽しむ「Instagram」。</p>
<p>その仕組みや、機能に興味を持った私達は、この「Instagram」のようなアプリケーション開発に取り組んでまいりました。</p>
<p>こちらのアプリケーション開発では、<strong>未だ触れた事のない機能や、技術を取り入れる事に積極的に挑みました。</strong><br>その例として、Dockerを導入する事により誰でもdockerイメージを共有可能にする事や、ActionCableを使用し、WebSocket通信を使ったメッセージ機能等、知識が0だった私達は、新たな技術を多く取り入れました。<br>その中で生まれるチームワークや、多くのスキルアップが表れるようなアプリケーションになっております。ご紹介してまいりたいと思います。</p>
<br>

## 本番環境について

- **アプリケーションURL**
  - http://54.168.202.179/
- **ゲストログインするには？**
  - ログインページのログインフォームにある「ゲストログイン」のボタンをクリック。<br>
    ※ゲストログインしているユーザーは「プロフィール編集」と「パスワード編集」が出来ませんので、ご注意下さい。
<br>

## アプリケーション機能一覧

- アカウント認証機能（devise）
- ゲストログイン機能
- 画像・動画新規投稿機能(最大10枚投稿可能/画像・動画の同時投稿可能)
- 投稿詳細機能(モーダルウィンドウでの表示有)
- 投稿編集・削除機能
- 画像・動画複数のレスポンシブスライダー機能(slick)
- 投稿コメント機能(ajax)
- 投稿いいね機能(ajax)
- ユーザーフォロー機能(ajax)
- ユーザー一覧機能
- ユーザー詳細機能
- ユーザー検索機能(インクリメンタルサーチ)
- ユーザーオンライン/オフライン表示機能
- 非同期でのメッセージ機能(ActionCable・Websocket)
- おすすめ機能(「いいね」の多い順に投稿表示)
- ハッシュタグ機能
<br>

## 使用技術一覧

**【フロントサイド】**
- HTML
- CSS
- Haml
- Scss
- JavaScript
- jQuery
- Bootstrap(モーダル表示のみ)
- slick
<br>

**【サーバサイド】**
- Ruby2.5.1
- Ruby on Rails 5.2.4.3
<br>

**【DB】**
- MySQL
<br>

**【開発環境】**
- Docker
- docker-compose
- GitHub
- GitHub Desktop
- Visual Studio Code
<br>

**【本番環境】**
- AWS（EC2/S3）
- Nginx（Webサーバー）
- Unicorn（アプリケーションサーバー）
- Capistrano(自動デプロイ)
<br>

## アプリケーションについて

<p>「Instagram」のようなSNSアプリケーションです。</p>
<p>▶︎投稿：最大10枚の画像・動画が投稿でき、コメント・いいね等を通して他のユーザーの反応がご覧になれます。</p>
<p>▶︎フォロー：ユーザーをフォローする事でいつでも友達の投稿がご覧になれます。</p>
<p>▶︎ダイレクトメッセージ：一人一人と会話が可能です。</p>
<p>▶︎おすすめページ：「いいね」が付いている投稿が、「いいね」の多い順番で表示されます。</p>
<br><br>




## イメージ

### 1.TopPage
![PhotoTop](https://i.gyazo.com/5360fa96a12629468fcb50e18d692b32.gif)
### 2.Post
![Post](https://i.gyazo.com/79b622a96354958d526e9a7261e2637c.png)
### 3.Message
![Message](https://i.gyazo.com/6bd61379796be52d19e75e66a63d0e2b.gif)
### 4.User online / offline
![Message](https://i.gyazo.com/56b57556d0072dddc9381ab10b2aa51d.png)
### 5.PostList
![PostList](https://i.gyazo.com/62e46e39af4b15e722e0fe72bc733610.gif)
### 6.Profile
![Profile](https://i.gyazo.com/de14ad2f4dab5ac5e7cea68023aa920d.jpg)
### 7.ProfileEdit
![PhotoTop](https://i.gyazo.com/ad2d0c016d9e7c2e245a8a02774061f9.png)
### 8.PasswordEdit
![PasswordEdit](https://i.gyazo.com/76e15ee74a2a45a3190303b45c590a09.png)
### 9.SignIn
![SignIn](https://i.gyazo.com/47699c005015975e38294f78f4b98441.gif)
### 10.SignUp
![SignUp](https://i.gyazo.com/8e7081c3e0a6f4ac8ab9eafca6b1b37b.gif)

## DB設計

### ER図
![ER](https://i.gyazo.com/c74c7308cd2b01101449636faa3f11b5.png)

**`userテーブル`**
|Column|Type|Option|
|------|----|------|
|username|string|null: false|
|nickname|string|null: false|
|email|string|null: false, default: ""|
|password|string|null: false, default: ""|
|phonenumber|integer||
|gender|string||
|text|text||
|image|string||
|online|boolean|default: false|

**Association**
- has_many :messages
- has_many :comments, dependent: :destroy
- has_many :room_users
- has_many :rooms, through: :room_users, dependent: :destroy
- has_many :posts, dependent: :destroy
- has_many :likes, dependetn: destroy
- has_many :like_posts, through: :likes, source: :post
- has_many :follows, foreign_key, 'follower_id'
- has_many :followings, through: :follows, source: :following
- has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'following_id'
-   has_many :followers, through: :reverse_of_follows, source: :follower
<br>

**`postテーブル`**
|Column|Type|Option|
|------|----|------|
|content|text|null: false|
|user_id|reference|null: false, foreign_key: true|

**Association**
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user
- belongs_to :user
- has_many :tag_posts, dependent: :delete_all
- has_many :tags, through: :tag_posts
- has_many :images, dependent: :destroy
<br>

**`followテーブル`**
|Column|Type|Option|
|------|----|------|
|following_id|reference|null: false, foreign_key: { to_table: :users }|
|follower_id|reference|null: false, foreign_key: { to_table: :users }|

**Association**
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"
<br>

**`imageテーブル`**
|Column|Type|Option|
|------|----|------|
|image|string|null: false|
|post_id|reference|null: false, foregin_key: true|

**Association**
- belongs_to :post, optional: true
<br>

**`messageテーブル`**
|Column|Type|Option|
|------|----|------|
|content|string|null: false, foregin_key: true|
|user_id|bigint|null: false, foregin_key: true|
|room_id|bigint|null: false, foregin_key: true|

**Association**
- belongs_to :user
- belongs_to :room
<br>

**`roomテーブル`**
|Column|Type|Option|
|------|----|------|

**Association**
- has_many :room_users, dependent: :destroy
- has_many :users, dependent: :destroy, through: :room_users
- has_many :messages, dependent: :destroy
<br>

**`tagテーブル`**
|Column|Type|Option|
|------|----|------|
|name|string|null: false|

**Association**
- has_many :tag_posts, dependent: :delete_all
- has_many :posts, through: :tag_posts
<br>

**`tag_postテーブル`**
|Column|Type|Option|
|------|----|------|
|tag_id|reference|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|

**Association**
- belongs_to :post
- belongs_to :tag
<br>

**`likeテーブル`**
|Column|Type|Option|
|------|----|------|
|user_id|reference|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|

**Association**
- belongs_to :user
- belongs_to :post
<br>

**`commentテーブル`**
|Column|Type|Option|
|------|----|------|
|content|string|null: false|
|user_id|reference|null: false, foreign_key: true|
|post_id|reference|null: false, foreign_key: true|

**Association**
- belongs_to :user
- belongs_to :post
<br>

**`room_userテーブル`**
|Column|Type|Option|
|------|----|------|
|user_id|bigint|null: false, foreign_key: true|
|room_id|bigint|null: false, foreign_key: true|

**Association**
- belongs_to :user
- belongs_to :room
