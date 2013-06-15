class ChatsController < ApplicationController

  def show
    @chat = Chat.find_by_slug(params[:id])
  end
end
