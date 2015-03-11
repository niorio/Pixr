class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def log_in(user)
    @current_user = user
    session[:token] = user.reset_token
  end

  def log_out
    current_user.reset_token if current_user
    session[:token] = nil
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def signed_in?
    !!current_user
  end

  def must_be_signed_in
    redirect_to welcome_url unless signed_in?
  end

end
