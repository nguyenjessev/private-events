module SessionsHelper
  def user_logged_in?
    if session[:user_id].nil?
      return false
    end

    true
  end
end
