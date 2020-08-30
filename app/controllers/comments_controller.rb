class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json
      end
    end
  end

  def show_create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.json
      end
    end
  end


  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
