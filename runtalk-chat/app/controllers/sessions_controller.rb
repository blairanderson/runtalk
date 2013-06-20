class SessionsController < ApplicationController
  def new
  end

  def create

    user = login(params[:username], 
                 params[:password],
                 remember_me = false)

    if user
      redirect_to root_path
    else
      redirect_to new_sessions_path, :notice => "Invalid credentials"
    end

    
  end
end
