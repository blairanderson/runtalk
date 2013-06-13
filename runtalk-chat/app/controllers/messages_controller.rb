class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to root_path, notice: "SUCCESS"
    else
      redirect_to root_path, notice: "NOPE!"
    end
  end
end
