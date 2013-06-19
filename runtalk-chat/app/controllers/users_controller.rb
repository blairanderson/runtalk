class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.valid?
      redirect_to root_url, :notice => "Account created"
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