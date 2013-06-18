class PhotosController < ApplicationController
  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    
    @message = @chat.messages.create(content: "Adding Photo")
    if @photo = @message.build_photo
      @photo.photo_url = params[:filepicker_url]
      @photo.save
    end

    respond_to do |format|
      if @photo.persisted?
        format.html { redirect_to chat_path(@chat) }
        format.js {@message}
      end
    end
  end
  
end



