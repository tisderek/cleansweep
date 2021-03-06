TWILIO_SID=ENV["TWILIO_SID"]
TWILIO_TOKEN=ENV["TWILIO_TOKEN"]
MAPBOX_PUB_TOKEN=ENV["MAPBOX_PUB_TOKEN"]

# ----------- CREATE -----------

get '/park' do

  erb :"parking_events/new"
end

post '/park' do
  @parked = ParkingEvent.new(
    lat: params[:lat],
    lng: params[:lng]
    )
  @parked.user_id = user.id
  
  if @parked.save
    redirect "/parked/#{@parked.id}"
  else
    erb :"parking_events/show", locals: { parked: @parked,  header: "Here's the 411" }
  end
end

#----------- INDEX -----------

# get '/parked' do

#   erb :"parking_events/index"
# end

#----------- SHOW -----------

get '/parked/:id' do
  @parked = ParkingEvent.find(params[:id])
  if @parked.get_route == nil
    erb :"parking_events/404", locals: { header: "Whoops" }
  else
    erb :"parking_events/show", locals: { parked: @parked,  header: "Here's the 411" }
  end
end

# ----------- SEND TXT  -----------

get '/parked/:id/text' do
  @parked = ParkingEvent.find(params[:id])
  user.send_sms(
      "Hey, #{username}! CleanSweep here. The next street sweep for the vehicle you just parked is #{@parked.get_route.strftime("%A at %-l:%M%P")}"
    )

end


