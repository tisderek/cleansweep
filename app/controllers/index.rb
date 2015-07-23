get '/' do
  if logged_in?
    erb :dashboard
  else
    erb :splash, layout: false
  end
end

#----------- SESSIONS -----------

post '/sessions' do
  login
end

get '/logout' do
  logout
  redirect '/'
end

#----------- USERS -----------

get '/dashboard' do

  erb :dashboard
end


post '/users' do
  
  signup
  login
  #RF to current_user
  @user = User.find_by(email: params[:user][:email])
  redirect '/dashboard'
end

