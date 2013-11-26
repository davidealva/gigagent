class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(user)
    user_url(user)
  end
end
