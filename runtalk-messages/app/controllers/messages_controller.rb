class MessagesController < ApplicationController

  def index
    @messages = Message.where(chat_id: params[:chat_id] ).includes(:location).last(20)
    render :json => @messages
  end
end
