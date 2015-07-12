helpers do

  def signup
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
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
    session[:user_id] = nil
  end

end
