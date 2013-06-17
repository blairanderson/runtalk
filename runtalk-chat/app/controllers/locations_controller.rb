class LocationsController < ApplicationController

  def create
    @chat = Chat.find_by_slug(params[:chat_id])
    
    @message = @chat.messages.create(content: "Adding Location")
    if @location = @message.build_and_validate_location(location_params)
      @message.save
    end

    respond_to do |format|
      if @location.persisted?
        format.html { redirect_to chat_path(@chat) }
        format.js {@message}
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
