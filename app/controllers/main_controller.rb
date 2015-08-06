
#------ ROOT  -------

get '/' do
  if logged_in?
    erb :dashboard
  else
    erb :splash, layout: false
  end
end

#------ LOGIN --------

post '/login' do
  login

  redirect '/'
end

#------ LOGOUT -------

get '/logout' do
  logout

  redirect '/'
end


