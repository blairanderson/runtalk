class InvitationsController < ApplicationController

  def new 
    @chat = Chat.find_by_slug(params[:chat_id])
    @invitation = Invitation.new
  end

  def create 

    @chat = Chat.find_by_slug(params[:chat_id])

    Invitation.create(params[:invitation]).send_text
    
    redirect_to chat_path(@chat)
  end
end
