get '/' do
  if logged_in?
    erb :dashboard
  elsif !User.find(sessions[:token])
    logout
  else
    erb :splash, layout: false
  end
end

#----------- SESSIONS -----------

get '/logout' do
  logout

  redirect '/'
end

get '/sessions/new' do

  erb :"sessions/_signin"
end

post '/sessions' do
  login

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

#----------- USERS -----------

get '/users/new' do

  erb :"sessions/_signup"
end

post '/users' do
  signup
  login

  redirect '/home'
end

get '/home' do

  erb :home
end
