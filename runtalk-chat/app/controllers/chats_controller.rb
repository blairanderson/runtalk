class ChatsController < ApplicationController

  def index
    
  end
  
  def show
    @chat = Chat.find_by_slug(params[:id])
  end
end
