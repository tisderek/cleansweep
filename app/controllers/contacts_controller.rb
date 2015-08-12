#----------- HOME / INDEX -----------

get '/contacts' do
  user_contacts = user.contacts
  
  if request.xhr?
   request.xhr? erb :"/contacts/_index", layout: false, locals: { contacts: user_contacts}
  else  
    erb :"/contacts/_index", locals: { contacts: user_contacts}
  end
end

#----------- CREATE -----------

get '/contacts/new' do

  erb :"/contacts/_new"
end

post '/contacts' do
  Contact.create(
    name: params[:name],
    phone_number: params[:phone_number],
    user_id: user_id
    )

  redirect '/contacts'
end

#----------- SHOW -----------

get '/contacts/:id' do
  @contact = Contact.find(params[:id])

  erb :"/contacts/_show", locals: { contact: @contact }
end


#----------- EDIT -----------

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])

  erb :"/contacts/_edit"
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(
    name: params[:name],
    phone_number: params[:phone_number]
  )

  redirect "/users/:user_id/contacts/#{@contact.id}"
end

#----------- DELETE -----------


delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect "/contacts"
end
