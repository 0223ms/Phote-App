class PostsController < ApplicationController
  before_action :move_to_index, only: [:new, :create, :edit, :update]
  # before_action :post_item, except: [:index, :new, :create]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end
  
  def new
    @post = Post.new
    @post.images.build
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
end
