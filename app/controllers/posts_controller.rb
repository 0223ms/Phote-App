class PostsController < ApplicationController


  def index
    @posts = Post.all
  end
  
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
  def post_params
    params.require(:post).permit(:image, :content).merge(user_id: current_user.id)
  end

  def set_tweet
    @post = Post.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
