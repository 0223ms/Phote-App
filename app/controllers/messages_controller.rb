class MessagesController < ApplicationController
  before_action :like_data
  before_action :set_users
  
  def show
    unless RoomUser.where(user_id: current_user.id).blank?
      @room_users = RoomUser.where(user_id: current_user.id).select(:room_id)
    end

    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
    @user = @room.users.select{ |user| user != current_user }[0]
  end

  private

  def like_data
    my_posts = Post.where(user_id: current_user.id).ids
    @likes = Like.where(post_id: my_posts)
  end
  
  def set_users
    @search_users = User.where.not(id: current_user.id)
  end
end
