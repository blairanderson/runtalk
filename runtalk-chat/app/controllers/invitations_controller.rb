class InvitationsController < ApplicationController

  def new 
    @chat_id = params[:chat_id]
    @invitation = Invitation.new
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      UserMailer.send_registered_user_invitation(user.email)
    else
      UserMailer.send_invitation(params[:email])
    end

    redirect_to chat_path(params[:chat_id])
  end
end