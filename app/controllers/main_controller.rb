get '/' do
  if logged_in?
    erb :dashboard
  else
    erb :splash, layout: false
  end
end

#-------  DASHBOARD  --------

get '/dashboard' do

  erb :dashboard
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

