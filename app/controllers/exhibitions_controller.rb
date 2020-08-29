class ExhibitionsController < ApplicationController
  before_action :like_data
  before_action :set_users
  before_action :set_show_user, only: [:show, :save_post, :tag_post]
  
  def show
    @posts = @user.posts
  end

  def save_post
    likes = @user.likes.ids
    @user_likes = Like.where(id: likes)
    # binding.pry
  end

  def tag_post
  end

  private
  def set_show_user
    @user = User.find(params[:id])
  end

  def like_data
    my_posts = Post.where(user_id: current_user.id).ids
    @likes = Like.where(post_id: my_posts)
  end

  def set_users
    @search_users = User.where.not(id: current_user.id)
  end
end
