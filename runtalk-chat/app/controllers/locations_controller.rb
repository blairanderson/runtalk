class LocationsController < ApplicationController

  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    
    respond_to do |format|
      if @message = Message.build_location_for_chat(location_params, @chat)
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

  def location_params
    {
      latitude: params[:latitude],
      longitude: params[:longitude],
      accuracy: params[:accuracy]
    }
  end
end
