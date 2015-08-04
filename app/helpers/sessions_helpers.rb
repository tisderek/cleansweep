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
    @user = User.find_by(phone_number: masked_phone_to_num(params[:phone_number]))
    if @user.password == params[:password]
      @user.generate_token
      session[:token] = @user.token
    end
  end

  def logout
    session[:token] = nil
  end

  def logged_in?
    !!session[:token]
  end

  def user
    User.find_by(token: session[:token])
  end

  def username
    user.name
  end

end
