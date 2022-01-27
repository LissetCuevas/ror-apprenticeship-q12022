class ApplicationController < ActionController::Base
  def user_logged
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
