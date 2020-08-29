class PostsController < ApplicationController
  before_action :move_to_index, only: [:new, :create, :edit, :update]
  before_action :like_data
  before_action :set_users
  # before_action :post_item, except: [:index, :new, :create]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
    @users = User.where.not(id: current_user.id).limit(5)
  end
  
  def new
    @post = Post.new
    @post.images.build
    @user = User.find(current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
      flash.now[:alert] = "投稿に失敗しました"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to root_path
  end


  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def like_data
    my_posts = Post.where(user_id: current_user.id).ids
    @likes = Like.where(post_id: my_posts)
  end

  def set_users
    @search_users = User.where.not(id: current_user.id)
  end
end
