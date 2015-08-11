
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
  if logged_in?
    redirect '/'
  else
    erb :splash, layout: false
  end

end

#------ LOGOUT -------

get '/logout' do
  logout

  redirect '/'
end


