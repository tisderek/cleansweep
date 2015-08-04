#---- CREATE USER / SIGNUP ----

post '/users' do
  signup
  login

  redirect '/'
end

#--- SHOW USER / PVT USER PAGE ---

get '/users/:id' do
  # define @var if used in erb or
  # define var and pass as local

  # erb :user_show
  # erb :"user/show"
end

#--------- INDEX USER ------------

get '/users' do
  all_users = User.all

  # erb :user_index, locals: {pool: all_users}
  # erb :"user/index", locals: {pool: all_users}
end

#--------- EDIT USER -------------

put '/users/:id' do
  updated_user = User.find(params[:id])

  updated_user.update_attributes()

  # redirect '/users/#{updated_user.id}'
  # redirect '/users'
end

#--------- DELETE USER -----------

delete '/users/:id' do
  User.find(params[:id]).destroy

  # redirect '/users'
end

