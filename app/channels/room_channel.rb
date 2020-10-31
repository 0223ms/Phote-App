class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    before_time = Message.where(room_id: data['room_id']).last.created_at.strftime("%Y年%-m月%-d日 %-H:%M")
    message = Message.create!(content: data['content'], user_id: data['user_id'], room_id: data['room_id'])
    time = message.created_at.strftime("%Y年%-m月%-d日 %-H:%M")
    data['time'] = time
    data['current_user_id'] = current_user.id
    data['before_time'] = before_time
    ActionCable.server.broadcast 'room_channel', data
  end
end
