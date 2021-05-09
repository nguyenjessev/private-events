class ApplicationController < ActionController::Base
  private

  def require_login
    return if User.exists?(session[:user_id])

    flash[:error] = 'You must be logged in to do that'
    redirect_to new_session_path
  end
end
