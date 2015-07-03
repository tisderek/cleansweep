class Route < ActiveRecord::Base
  
  def self.import_shapefile
		RGeo::Shapefile::Reader.open('../../lib/sf_routes/sfsweeproutes.shp') do |file|
		  puts "File contains #{file.num_records} records."
		  file.each do |record|
		    args = Hash[record.attributes.map{|(k,v)| [k.downcase.to_sym,v]}]
		    # args[:geometry] = record.geometry
		    Route.create(args)
		  end
		  file.rewind
		  record = file.next
		  puts "First record geometry was: #{record.geometry.as_text}"
		end
	end

end




