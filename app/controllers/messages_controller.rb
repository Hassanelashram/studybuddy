class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def create
    @message = @chat.messages.new(message_params)
    @message.user = current_user
    authorize @message

    ChatroomChannel.broadcast_to(
      @chat,
      render_to_string(partial: "chats/message", locals: { message: @message })
    ) if @message.save

    head :no_content
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
