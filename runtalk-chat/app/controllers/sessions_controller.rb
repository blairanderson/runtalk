class SessionsController < ApplicationController
  def new
  end

  def create

    user = login(params[:username], 
                 params[:password],
                 remember_me = false)

    if user
      puts "hello"
    else
      puts "no user"
    end

    redirect_to root_path
  end
end
