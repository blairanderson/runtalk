class PhotosController < ApplicationController
  
  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    @message = Message.build_photo_for_chat(photo_params, @chat.id)

    Channel.publish(:chat_message, @message)
    respond_to do |format|
      format.js do
        @message
        render "messages/create"
      end
      format.html do
        redirect_to chat_path(@chat) 
      end
    end
  end

  def photo_params
    {photo_url: params[:photo_url]}
  end
end



