require 'rgeo/shapefile'

User.create(
    name: "admin",
    email: "the@admin.com",
    phone_number: 0,
    password: 123123
  )

RGeo::Shapefile::Reader.open('db/routes/routes.shp') do |file|
  puts "File contains #{file.num_records} records."
  file.each do |record|
    args = Hash[record.attributes.map{|(k,v)| [k.downcase.to_sym,v]}]
    args.delete(:blockside)
    args.delete(:blocksweep)
    args.delete(:cnn)
    args.delete(:corridor)
    args.delete(:district)
    args.delete(:nhood)
    args.delete(:zip_code)
    if args[:weekday] == "Sun"
      args[:weekday] = "Sunday"
    elsif args[:weekday] == "Mon"
      args[:weekday] = "Monday"
    elsif args[:weekday] == "Tue"
      args[:weekday] = "Tuesday"
    elsif args[:weekday] == "Wed"
      args[:weekday] = "Wednesday"
    elsif args[:weekday] == "Thu"
      args[:weekday] = "Thursday"
    elsif args[:weekday] == "Fri"
      args[:weekday] = "Friday"
    elsif args[:weekday] == "Sat"
      args[:weekday] = "Saturday"
    end
    Route.create(args)
  end
  file.rewind
  record = file.next
  break if record.index == 1000
end

ParkingEvent.create(
  lat: 37.714488,
  lng: -122.398272,
  user_id: 1
)
ParkingEvent.create(
  lat: 37.726234,
  lng: -122.466326,
  user_id: 1
)

ParkingEvent.create(lat: 37.784126, lng: -122.395826)