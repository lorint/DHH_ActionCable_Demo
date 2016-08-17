# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # This was originally in place here for testing, but gets moved into message_broadcast_job.rb
    # ActionCable.server.broadcast 'room_channel', message: data['message']

    Message.create! content: data['message']
  end
end
