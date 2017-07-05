class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def is_admin!
  	if (current_user and !current_user.is_admin?)
  		redirect_to root_path
  	elsif !current_user
  		redirect_to new_user_session_path
  	end
  end
end
