class ChatsController < ApplicationController

  def index
    @chat = Chat.new
  end

  def show
    @chat = Chat.find_by_slug(params[:id])
  end
end
