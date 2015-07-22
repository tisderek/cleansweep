
#----------- CREATE -----------

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

#----------- INDEX -----------

get '/contacts' do
  @contacts = Contact.where(user_id: user_id)

  erb :"/contacts/_index", locals: { contacts: @contacts }
end

#----------- EDIT -----------

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])

  erb :"/contacts/_edit"
end

#----------- EDIT -----------

put '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.update_attributes(
    name: params[:name],
    phone_number: params[:phone_number]
  )

  redirect "/users/:user_id/contacts/#{@contact.id}"
end

#----------- SESSIONS -----------


delete '/contacts/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect "/contacts"
end
