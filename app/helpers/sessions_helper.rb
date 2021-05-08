module SessionsHelper
  def user_logged_in?
    return true if User.exists?(session[:user_id])

    false
  end
end
