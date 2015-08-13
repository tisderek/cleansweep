helpers do

  def signup
    @user = User.new(
      name: params[:name],
      phone_number: just_nums(params[:phone_number]),
      email: params[:email]
      )
    @user.password = params[:password]
  end

  def session_error
    {
     signup: "Either you already have an account or your password is too short!"
    }
  end

  def just_nums(phone_number)
    phone_number.gsub(/[^\d]/, "")
  end

  def login
    user_to_login = User.find_by(
      phone_number: just_nums(params[:phone_number])
    )
    if user_to_login.password == params[:password]
      user_to_login.generate_token
      session[:token] = user_to_login.token
    end
  end

  def logout
    session[:token] = nil
  end

  def logged_in?
    !!session[:token] && user
  end

  def user
    @user ||= User.find_by(token: session[:token])
  end

  def username
    user.name
  end

  def user_authorized?
    params[:id] == user.id
  end

end
