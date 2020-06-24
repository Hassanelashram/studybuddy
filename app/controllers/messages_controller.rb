class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def index
    @other_user = current_user == @chat.sender ? @chat.recipient : @chat.sender
    @messages = @chat.messages.order(created_at: :asc).last(20)
    @message = Message.new
  end

  def create
    @message = @chat.messages.new(message_params)
    @message.user = current_user
    @messages = @chat.messages.order(created_at: :desc)
    if @message.save
      redirect_to chat_messages_path(@chat)
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
