class FollowsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.following(@user)
    if following.save
      redirect_to exhibition_path(id: @user)
    else
      redirect_to exhibition_path(id: @user)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to exhibition_path(id: @user)
    else
      redirect_to exhibition_path(id: @user)
    end
  end

  def top_create
    following = current_user.following(@user)
    if following.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def top_destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  
  def set_user
    @user = User.find(params[:follow][:following_id])
  end
end
