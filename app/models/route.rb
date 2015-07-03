require 'rgeo/shapefile'

class Route < ActiveRecord::Base
  
  def self.import_shapefile(filename)
		RGeo::Shapefile::Reader.open(filename) do |file|
		  puts "File contains #{file.num_records} records."
		  file.each do |record|
		  	# puts record.attributes
		    args = Hash[record.attributes.map{|(k,v)| [k.downcase.to_sym,v]}]
		    # args.store(:geo, record.geometry)
		    Route.create(args)
		  	if record.index == 30 then break end
		  end
		  file.rewind
		  record = file.next
		  puts "First record geometry was: #{record.geometry.as_text}"
		end
	end

end




