class MessagesController < ApplicationController

  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    @message = @chat.messages.build(params[:message])
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to chat_path(@chat) }
        format.js {@message}
      end
    end
  end

  def index
    @chat = Chat.find_by_slug(params[:chat_id])
    redirect_to @chat
  end
end
