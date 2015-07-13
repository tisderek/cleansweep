get '/' do
  erb :landing
end

#----------- SESSIONS -----------

get '/sessions/new' do

  erb :_signin
end

post '/sessions' do
  login

  redirect '/home'
end

delete '/sessions/:id' do
  logout

  redirect '/'
end

#----------- USERS -----------

get '/users/new' do

  erb :_signup
end

post '/users' do
  signup
  login

  redirect '/home'
end

get '/home' do

  erb :home
end
