class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    @message.role = "user"

    if @message.save
      ruby_llm_chat = RubyLLM.chat
      ruby_llm_chat.with_instructions(@chat.health_goal.system_prompt)

      @chat.messages.order(:created_at).where.not(id: @message.id).each do |msg|
        ruby_llm_chat.add_message(role: msg.role.to_sym, content: msg.content)
      end

      response = ruby_llm_chat.ask(@message.content)
      @chat.messages.create(role: "assistant", content: response.content)

      maybe_generate_chat_title
      redirect_to chat_path(@chat)
    else
      redirect_to chat_path(@chat), alert: "Could not send message."
    end
  end

  private

  def message_params
    params.fetch(:message, {}).permit(:content, :attachment_url)
  end

  def maybe_generate_chat_title
    return if @chat.title.present?
    return unless @chat.messages.count >= 3
    # Placeholder: AI title generation goes here once the AI integration exists.
    # @chat.update(title: AiTitleGenerator.call(@chat))
  end
end
