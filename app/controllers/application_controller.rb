class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user #says "this method in controller is also a helper in views"

  private
  #stores the session information from cookies in the server,
  # a link to that session is stored on the browser
  #session is a hash, :user_id is the key
  def current_user
  #memoization
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
