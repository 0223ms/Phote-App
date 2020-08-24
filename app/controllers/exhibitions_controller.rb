class ExhibitionsController < ApplicationController
  before_action :like_data
  
  def show
    @user = User.find(params[:id])
  end

  def save_post
    @user = User.find(params[:id])
  end

  def tag_post
    @user = User.find(params[:id])
  end

  private

  def like_data
    my_posts = Post.where(user_id: current_user.id).ids
    @likes = Like.where(post_id: my_posts)
  end
end
