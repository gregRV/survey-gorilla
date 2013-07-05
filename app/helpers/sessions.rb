helpers do

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    current_user != nil
  end

  # def check_password(email, password)
  #   user=User.find_by_email(email)
  #   user.password==password
  # end

end
