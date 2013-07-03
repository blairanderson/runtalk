class LocationsController < ApplicationController

  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    @message = MessageProxy.build_location_for_chat(location_params, @chat.id)
    @message.profile = Profile.find_by_id(session[:profile_id])
    
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

  def location_params
    {
      latitude: params[:latitude],
      longitude: params[:longitude],
      accuracy: params[:accuracy]
    }
  end
end
