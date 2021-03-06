class ChatsController < ApplicationController
  before_filter :load_current_user, only: [:show]
  def index
    @chat = Chat.new
    @search_data = Chat.all.map(&:slug)
  end

  def show
    @chat = Chat.find_by_slug(params[:id])
  end

  def load_current_user
    @chat = Chat.find_by_slug(params[:id])
    unless session[:profile_id]
      redirect_to chat_name_path(@chat)
    end
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
