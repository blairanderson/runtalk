class ChatsController < ApplicationController

  def index
    @chat = Chat.new
    @search_data = Chat.all.map(&:slug)
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

  def search
    @chat = Chat.find_by_slug(params[:id])
    if @chat
      redirect_to @chat
    else
      redirect_to root_path, notice: "that room does not exist"
    end
  end
end
