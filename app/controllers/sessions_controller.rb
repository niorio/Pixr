class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'new'
  end

  def create
    user = User.find_by_credentials(params[:user][:username],
            params[:user][:password])
    if user
      log_in(user)
      redirect_to ''
    else
      @user = User.new(username: params[:user][:username])
      flash.now[:errors] = "Incorrect Username and/or Password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to welcome_url
  end

  def omniauth
    user = User.find_or_create_by_auth_hash(auth_hash)
    if user.new_record?
      @user = user
      render 'users/new'
    else
      sign_in!(user)
      redirect_to root_url
    end
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end

end
