get '/' do
  if current_user
    erb :dashboard
  else
    erb :splash, layout: false
  end
  erb :splash
end

#----------- SESSIONS -----------

post '/sessions' do
  login
end

get '/sessions/logout' do

end 
get '/sessions/new' do

  erb :"sessions/_signin"
end

post '/sessions' do
  login

  redirect '/home'
end

delete '/sessions/:id' do
  logout

  redirect '/'
end

# delete '/sessions/:id' do
#   logout

#   redirect '/'
# end

#----------- USERS -----------

get '/dashboard' do

  erb :dashboard
end

# get '/users/new' do

#   erb :"sessions/_signup"
# end

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
