class InvitationsController < ApplicationController

  def new 
    @chat = Chat.find_by_slug(params[:chat_id])
  end

  def create 

    @chat = Chat.find_by_slug(params[:chat_id])

    invitation = Invitation.new(params)

    Channel.publish(:send_invitation, invitation)
    
    redirect_to chat_path(@chat)
  end
end
