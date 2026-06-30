class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  def create
    @health_goal = HealthGoal.find(params[:health_goal_id])
    @chat = @health_goal.chats.new(chat_params)
    @chat.user = current_user

    if @chat.save
      redirect_to chat_path(@chat)
    else
      redirect_to health_goal_path(@health_goal), alert: "Could not start chat."
    end
  end

  private

  def chat_params
    params.fetch(:chat, {}).permit(:title)
  end
end
