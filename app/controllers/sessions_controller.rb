class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def create
    user = User.find_by_credentials(params[:user][:email],
            params[:user][:password])
    if user
      log_in(user)
      redirect_to ''
    else
      @user = User.new(email: params[:user][:email])
      flash.now[:errors] = "Incorrect Email and/or Password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to welcome_url
  end

end
