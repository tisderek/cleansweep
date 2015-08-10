#---- CREATE USER / SIGNUP ----

post '/users' do
  if signup
    login
    redirect '/'
  else
    @error = {
      signup_error: "Uh-oh. It seems like you either already have an account, or your password didn't fit the requirement"
    }
    erb :splash  
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

