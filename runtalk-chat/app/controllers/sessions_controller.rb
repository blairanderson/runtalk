class SessionsController < ApplicationController
  def new
    @user = OpenStruct.new(username: "", password: "")
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

  def destroy
    logout
    redirect_to root_path, notice: "You've been Logged Out. GOODBYE"
  end
end
