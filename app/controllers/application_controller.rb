class ApplicationController < ActionController::Base
  # before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :like_data

  private

  def production?
    Rails.env.production?
  end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end

  def like_data
    my_posts = Post.where(user_id: current_user.id).ids
    @likes = Like.where(post_id: my_posts)
  end
end
