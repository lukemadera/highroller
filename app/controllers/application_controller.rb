class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

#define current user
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_auth
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        if !current_user
          redirect_to root_path
        end
  end
  helper_method :current_user


end