class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    @chat = Chat.find_by_id(params[:chat_id])
    if @user.valid?
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
end