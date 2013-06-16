class ChatsController < ApplicationController

  def index
  end
  
  def show
    @chat = Chat.find_by_slug(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    chat = Chat.create(params[:chat])

    if !chat.valid?
      flash[:notice] = "Sorry, this chatroom name has already been taken"
      redirect_to new_chat_path 
    else
      redirect_to chat_path(chat)
    end  
  end
end
