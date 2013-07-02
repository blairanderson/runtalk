class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(params[:profile])
    @chat = Chat.find_by_slug(params[:chat_id])
    if @profile.save
      session[:profile_id] = @profile.id
      if @chat
        redirect_to @chat
      else
        redirect_to root_path, :notice => "Signed In"
      end
    else
      flash[:notice] = "Invalid!"
      render :new
    end
  end
end
