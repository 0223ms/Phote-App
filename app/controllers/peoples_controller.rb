class PeoplesController < ApplicationController
  before_action :like_data
  before_action :set_users

  def index
    @users = User.where.not(id: current_user.id).limit(100)
  end

  private

  def like_data
    my_posts = Post.where(user_id: current_user.id).ids
    @likes = Like.where(post_id: my_posts)
  end

  def set_users
    @search_users = User.where.not(id: current_user.id)
  end
end
