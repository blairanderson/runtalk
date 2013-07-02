class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], 
                 params[:password],
                 remember_me = false)
    @chat = Chat.find_by_slug(params[:chat_id])
    if user
      session[:profile_id] = user.profile.id
      if @chat
        redirect_to @chat
      else
        redirect_to root_path, :notice => "Signed In"
      end
    else
      redirect_to new_sessions_path, :notice => "Invalid credentials"
    end  
  end

  def destroy
    logout
    redirect_to root_path, notice: "You've been Logged Out. GOODBYE"
  end
end
