class MessagesController < ApplicationController

  def index
    @messages = Message.all.reverse
  end

  def create
    @message = Message.new(params[:message])
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path }
        format.js {@message}
      end
    end

  end
end
