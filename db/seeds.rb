require 'faker'
require 'rgeo/shapefile'


#open db/cleansweep_data.sql
#run db/cleansweep_data.sql
#sqlite3 .dump > db/routes.sql
# f = File.join(Dir.pwd, 'db', 'routes.sql')
# # ActiveRecord::Base.connection.execute(open(f).read)
# `cat #{file} | sqlite3 #{APP_ROOT}/cs_db.sqlite3`



User.create(
    name: "admin",
    email: "the@admin.com",
    phone_number: 0,
    password: 123123
  )
3.times do
  Contact.create(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    user_id: 1
  )
end
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    password: 6
  )
end

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

ParkingEvent.create(lat:37.784126, lng:-122.395826)
# Parking_event.new(latitude: 44.981667, longitude: -93.27833, user_id: 1)
# Faker::Name.name

# person_email           = Faker::Internet.email
# person_company         = Faker::Company.name
# person_company_slogan  = Faker::Company.bs
# person_phone           = Faker::PhoneNumber.phone_number
# person_address         = Faker::Address.street_address
# person_city            = Faker::Address.city
# person_state           = Faker::Address.us_state
# person_zip             = Faker::Address.zip_code

# User.create(
#   name: Faker::Name.name,
#   email: Faker::Internet.email,
#   phone_number: Faker::PhoneNumber.phone_number,
#   password: test]
#   )

# User.create( name:Devin Hauck,   )
# User.create( name:Eliza Bode,   )
# User.create( name:Kolby Effertz,   )
# User.create( name:Miss Heidi Christiansen,   )
# User.create( name:Austen Nader,   )
# User.create( name:Elfrieda Kunze,   )
# User.create( name:Lillian Buckridge,   )
# User.create( name:Kay Douglas,   )
# User.create( name:Dianna Casper MD,   )
# User.create( name:Terence Langosh,   )

# Contact.create()

# 10.times do  puts "
#   User.create(
#   name:"+Faker::Name.name,
#   email:"+Faker::Internet.email+",
#   phone_number:"+Faker::PhoneNumber.phone_number+",
#   password: 6,
#   name:"+Faker::Name.name
# end


# person_name            =
# person_email           = Faker::Internet.email
# person_company         = Faker::Company.name
# person_company_slogan  = Faker::Company.bs
# person_phone           = Faker::PhoneNumber.phone_number
# person_address         = Faker::Address.street_address
# person_city            = Faker::Address.city
# person_state           = Faker::Address.us_state
# person_zip             = Faker::Address.zip_code


# # Wowee-wow-wow. Now let's print him off some business cards
# puts "#{person_name}
# #{person_company}
# '#{person_company_slogan.capitalize}'
# #{person_address}
# #{person_city}, #{person_state} #{person_zip}
# Call me at : #{person_phone}
# Email me at: #{person_email}
# It's a pleasure doing business."

# # Awesome, now we can go into business and
# # get back our money from that Nigerian prince fellow...

