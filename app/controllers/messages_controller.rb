class MessagesController < ApplicationController
  def show
    unless RoomUser.where(user_id: current_user.id).blank?
      @room_users = RoomUser.where(user_id: current_user.id).select(:room_id)
    end

    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
  end
end
