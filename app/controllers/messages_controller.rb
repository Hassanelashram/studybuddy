class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def create
    @message = @chat.messages.new(message_params)
    @message.user = current_user
    @messages = @chat.messages.order(created_at: :desc)
    if @message.save
      redirect_to chat_path(@chat)
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
