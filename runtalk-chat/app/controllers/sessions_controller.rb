class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], 
                 params[:password],
                 remember_me = false)

    if user
      redirect_to root_path, :notice => "Signed In"
    else
      redirect_to new_sessions_path, :notice => "Invalid credentials"
    end  
  end

  def delete
    logout
    redirect_to root_url, :notice => "Logged out!"
  end
end
