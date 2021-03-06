class RoomsController < ApplicationController
  before_action :like_data
  before_action :set_users

  def index
    unless RoomUser.where(user_id: current_user.id).blank?
      @room_users = RoomUser.where(user_id: current_user.id).select(:room_id)
    end
  end

  def new
    @user = User.where.not(id: current_user.id)
    @room = Room.new
  end

  def create
    unless params[:room].blank?
      @room = Room.create
      @current_room_user = RoomUser.create(user_id: current_user.id, room_id: @room.id)
      @another_room_user = RoomUser.create(params.require(:room).permit(:user_id, :room_id).merge(:room_id => @room.id))  
      redirect_to rooms_path
    else
      redirect_to rooms_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    @users = User.where(['username LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(15)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    room = Room.find(params[:id])
    if room.destroy
      redirect_to rooms_path
    else
      redirect_to messages_path(id: room)
    end
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