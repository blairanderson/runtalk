class UsersController < ApplicationController
  def new
    @invitation = Invitation.find_by_unique_url(params[:activation_key])

    if @invitation
      @user = User.new
    else
      @user = User.new
    end
  end

  def create
    @user = User.create(params[:user])
    @chat = Chat.find_by_id(params[:chat_id])
    if @user.valid?
      auto_login(@user)
      if @chat
        redirect_to chat_path(@chat), :notice => "Account created" 
      else
        redirect_to root_path, :notice => "Account created" 
      end
    else
      render :new, :notice => "Sorry, invalid credentials"
    end
  end

  def add 
    @chat_id = params[:chat_id]
    @user = User.new
  end

  def invite
    user = User.find_by_email(params[:user][:email])

    if user
      UserMailer.send_registered_user_invitation(user.email)
    else
      UserMailer.send_invitation(params[:user][:email])
    end

    redirect_to chat_path(params[:user][:chat_id])
  end
end
