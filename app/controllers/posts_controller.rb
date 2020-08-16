class PostsController < ApplicationController


  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    @post.images.build
  end

  def show
    @post = Post.find_by(id:params[:id])
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
