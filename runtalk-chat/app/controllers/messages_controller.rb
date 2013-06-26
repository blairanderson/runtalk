class MessagesController < ApplicationController

  def create
    @message = MessageProxy.create(params)
    #saves a message for a given chatroom.
    @chat = Chat.find_by_slug(params[:chat_id])
    # @message = @chat.messages.build(params[:message])

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
