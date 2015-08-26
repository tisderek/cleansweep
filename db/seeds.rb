require 'rgeo/shapefile'

RGeo::Shapefile::Reader.open('db/routes/routes.shp') do |file|
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
    break if record.index == 2000
  end
  file.rewind
  record = file.next
end

User.create(
    name: "Derek",
    email: "the@admin.com",
    phone_number: 4154168654,
    password: 123123
  )

Contact.create(
    contact_name: "Carol",
    contact_phone_number: 4154168654,
    user_id: 1
  )
Contact.create(
    contact_name: "Leo",
    contact_phone_number: 4154168654,
    user_id: 1
  )

User.create(
    name: "Harvey",
    email: "the@admin.com",
    phone_number: 7406463285,
    password: 123123
  )
User.create(
    name: "Daniel Chen",
    email: "the@admin.com",
    phone_number: 4088588207,
    password: 123123
  )
User.create(
    name: "Marshall",
    email: "the@admin.com",
    phone_number: 6196722649,
    password: 123123
  )
User.create(
    name: "Jason",
    email: "the@admin.com",
    phone_number: 4086428138,
    password: 123123
  )
User.create(
    name: "Danny Shafer",
    email: "the@admin.com",
    phone_number: 5856439357,
    password: 123123
  )
User.create(
    name: "Andrew Patterson",
    email: "the@admin.com",
    phone_number: 2056168238,
    password: 123123
  )
User.create(
    name: "Ehtesham",
    email: "the@admin.com",
    phone_number: 4084874539,
    password: 123123
  )
User.create(
    name: "Sung",
    email: "the@admin.com",
    phone_number: 4159942058,
    password: 123123
  )
User.create(
    name: "Bikram",
    email: "the@admin.com",
    phone_number: 7314990321,
    password: 123123
  )
User.create(
    name: "Charlotte",
    email: "the@admin.com",
    phone_number: 5405208772,
    password: 123123
  )
User.create(
    name: "Lauryn",
    email: "the@admin.com",
    phone_number: 5038534277,
    password: 123123
  )
User.create(
    name: "John Hess",
    email: "the@admin.com",
    phone_number: 8052725632,
    password: 123123
  )
User.create(
    name: "Andrea",
    email: "the@admin.com",
    phone_number: 9787581400,
    password: 123123
  )
User.create(
    name: "Ma \"Kevin\" Yan",
    email: "the@admin.com",
    phone_number: 4089604418,
    password: 123123
  )
User.create(
    name: "Chris K",
    email: "the@admin.com",
    phone_number: 4156700774,
    password: 123123
  )
User.create(
    name: "Hooman",
    email: "the@admin.com",
    phone_number: 3108240774,
    password: 123123
  )
User.create(
    name: "Chris Scott",
    email: "the@admin.com",
    phone_number: 5109093590,
    password: 123123
  )
User.create(
    name: "Adam",
    email: "the@admin.com",
    phone_number: 5044180782,
    password: 123123
  )
User.create(
    name: "Tim",
    email: "the@admin.com",
    phone_number: 4159904786,
    password: 123123
  )
User.create(
    name: "Shahab",
    email: "the@admin.com",
    phone_number: 9259569660,
    password: 123123
  )
User.create(
    name: "Jacob Shafi",
    email: "the@admin.com",
    phone_number: 9259982763,
    password: 123123
  )
User.create(
    name: "Ryan Au",
    email: "the@admin.com",
    phone_number: 6265005826,
    password: 123123
  )
User.create(
    name: "Jacob Rogers",
    email: "the@admin.com",
    phone_number: 3107793957,
    password: 123123
  )
User.create(
    name: "Marisa",
    email: "the@admin.com",
    phone_number: 2142066892,
    password: 123123
  )
User.create(
    name: "Travis",
    email: "the@admin.com",
    phone_number: 8016525453,
    password: 123123
  )
User.create(
    name: "Aaron Jacon.",
    email: "the@admin.com",
    phone_number: 2488088695,
    password: 123123
  )
User.create(
    name: "Marshall",
    email: "the@admin.com",
    phone_number: 6196722649,
    password: 123123
)

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

