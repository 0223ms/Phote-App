class MessagesController < ApplicationController
  before_action :like_data
  
  def show
    unless RoomUser.where(user_id: current_user.id).blank?
      @room_users = RoomUser.where(user_id: current_user.id).select(:room_id)
    end

    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
  end

  private

  def like_data
    my_posts = Post.where(user_id: current_user.id).ids
    @likes = Like.where(post_id: my_posts)
  end
end
