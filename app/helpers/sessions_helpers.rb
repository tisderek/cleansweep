helpers do

  def signup
    @user = User.new(name: params[:name], phone_number: params[:phone_number].gsub(/[^\d]/, ""))
    @user.password = params[:password]
    @user.save!
  end

  def masked_phone_to_num(phone_number)
    phone_number.gsub(/[^\d]/, "")
  end

  def login
    user_to_login = User.find_by(
      phone_number: masked_phone_to_num(params[:phone_number])
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
    User.find_by(token: session[:token])
  end

  def username
    binding.pry
    user.name
  end

  def user_authorized?
    params[:id] == user.id
  end
end
