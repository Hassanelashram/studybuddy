class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def create
    @message = @chat.messages.new(message_params)
    @message.user = current_user
    @messages = @chat.messages.order(created_at: :desc)
    if @message.save
      ChatroomChannel.broadcast_to(
        @chat,
        {
          owner_partial: render_to_string(partial: "chats/message", locals: { message: @message, owner_of_message: false }),
          message_author: @message.user.id,
          reciever_partial: render_to_string(partial: "chats/message", locals: { message: @message, owner_of_message: true })
        }
      )
    end
    authorize @message
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
