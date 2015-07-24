helpers do

  def signup
    @user = User.new(name: params[:name], phone_number: params[:phone_number])
    @user.password = params[:password]
    @user.save!
  end

  def login
  @user = User.find_by(phone_number: params[:phone_number])
    
    if @user.password == params[:password]
      @user.generate_token
      session[:token] = @user.token
      redirect "/dashboard"
    end

  end

  def current_user
      if session[:token] == nil
        nil
      else
        User.find(session[:token])
    end
  end

  def current_user
      if session[:user_id] == nil
        nil
      else
        User.find(session[:user_id])
      end
  end

  def logout
    session[:token] = nil
  end

  def logged_in?
    if session[:token] == nil
      false
    else
      true
    end
  end

  def current_user
    User.find_by(token: session[:token])
  end

  def username
    current_user.username
  end

  def user_id
    current_user.id
    session[:user_id] = nil
  end

end
