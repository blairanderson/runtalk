class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.valid?
      redirect_to root_url, :notice => "Account created"
    else
      render :new, :notice => "Sorry, invalid credentials"
    end
  end
end