#---- CREATE USER / SIGNUP ----

post '/users' do
  signup
  if  @user.save
    login
    redirect '/'
  else
    @signup_errors = session_error[:signup]
    p @signup_errors

    erb :splash, layout:false
  end
end

#------- SHOW USER -------

get '/settings' do
  
  erb :"users/show"
end


#--------- EDIT USER -------------

put '/users/:id' do
    user.update_attributes(
      name: params[:name],
      phone_number: params[:phone_number],
      #DR: what do I do when its an edit?
      password: params[:password]
      )
    
    redirect "/"
end

#--------- DELETE USER -----------

delete '/users/:id' do
  user.destroy

  redirect "/"
end

