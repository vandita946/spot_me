class ChatroomChannel < ApplicationCable::Channel

  def subscribed
    # stream_from "some_channel"
    # Make the cable specific to 1 chatroom:
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
