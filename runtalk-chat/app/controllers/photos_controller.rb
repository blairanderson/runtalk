class PhotosController < ApplicationController
  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    
    respond_to do |format|
      if @message =  Message.build_photo_for_chat(photo_params, @chat)
        format.html do
          redirect_to chat_path(@chat) 
        end
        format.js do
          @message
          render "messages/create"
        end
      end
    end

  end

  def photo_params
    {photo_url: params[:photo_url]}
  end  
end


