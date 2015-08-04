#----------- LOGIN -----------

get '/logout' do
  logout

  redirect '/'
end

get '/sessions/new' do

  erb :"sessions/_signin"
end

#----------- SIGNUP -----------

post '/users' do
  signup
  login

  redirect '/dashboard'
end


post '/sessions' do
  login

  if logged_in?
    redirect "/dashboard"
  else
    redirect "/"
  end

end

