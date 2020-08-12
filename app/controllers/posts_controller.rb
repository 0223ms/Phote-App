class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
  def tweet_params
    post.permit(:name, :image, :text)
  end

end
