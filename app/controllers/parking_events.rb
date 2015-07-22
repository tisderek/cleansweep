
# ----------- CREATE -----------

get '/park' do

  erb :"/parking_events/new", layout: false
end

post '/park' do
  parked = ParkingEvent.create(
    lat: params[:lat],
    lng: params[:lng],
    user_id: user_id
    )

  redirect "/parked/#{parked.id}"
end

#----------- INDEX -----------

get '/parked' do

  erb :"/parking_events/index"
end

#----------- SHOW -----------

get '/parked/:id' do
  @parked = ParkingEvent.find(params[:id])
  @parked.send_sms(
    "CleanSweep over here. The next street sweep for the vehicle you just parked is #{@parked.get_route.strftime("%A at %-l:%M%P")}"
  )

  if @parked.get_route.nil?
    erb :"/parking_events/404", locals: { header: "Whoops" }
  else
    erb :"/parking_events/show", locals: { parked: @parked,  header: "Here's the 411" }
  end
end
