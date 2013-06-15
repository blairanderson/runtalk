class MessagesController < ApplicationController

  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    @message = @chat.messages.build(params[:message])
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to :back }
        format.js {@message}
      end
    end
  end
end
