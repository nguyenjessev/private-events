module SessionsHelper
  def user_logged_in?
    return true if User.exists?(session[:user_id])

    false
  end

  def current_user
    return User.find(session[:user_id]) if user_logged_in?

    nil
  end
end
