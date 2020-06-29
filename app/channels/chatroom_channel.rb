class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chat.find(params[:id])
    stream_for chatroom
  end


end
