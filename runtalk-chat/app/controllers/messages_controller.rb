class MessagesController < ApplicationController

  def create

    @chat = Chat.find_by_slug(params[:chat_id])

    @message = MessageProxy.build_proxy_message(
      params[:content], 
      @chat.id)
    
    Channel.publish(:chat_message, @message)

    respond_to do |format|
      format.html { redirect_to chat_path(@chat) }
      format.js {@message}
    end
  end

  def index
    @chat = Chat.find_by_slug(params[:chat_id])
    redirect_to @chat
  end
end
