class MessagesController < ApplicationController

  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    @message = MessageProxy.create(params, @chat.id)

    #renders the create.js page
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
