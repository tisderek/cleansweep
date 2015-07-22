class Route < ActiveRecord::Base

  before_create :format_st_names

  def format_st_names
    self.streetname = self.streetname.titlecase
      if self.streetname.split(" ")[1] == "St"
        self.streetname = self.streetname.gsub("St", "Street")
      elsif self.streetname.split(" ")[1] == "Ave"
        self.streetname = self.streetname.gsub("Ave", "Avenue")
      elsif self.streetname.split(" ")[1] == "Dr"
        self.streetname = self.streetname.gsub("Dr", "Drive")
      elsif self.streetname.split(" ")[1] == "Blvd"
        self.streetname = self.streetname.gsub("Blvd", "Boulevard")
      elsif self.streetname.split(" ")[1] == "Rd"
        self.streetname = self.streetname.gsub("Rd", "Road")
      elsif self.streetname.split(" ")[1] == "Ct"
        self.streetname = self.streetname.gsub("Ct", "Court")
      elsif self.streetname.split(" ")[1] == "Ter"
        self.streetname = self.streetname.gsub("Ter", "Terrace")
      elsif self.streetname.split(" ")[1] == "Aly"
        self.streetname = self.streetname.gsub("Aly", "Alley")
      end
      if self.streetname.split("")[0] = "0"
        self.streetname = self.streetname.gsub("0","")
      end
  end


  def make_time_obj
      d = date_of_next(self.weekday)
      t = self.fromhour
      s = DateTime.new(
        d.year,
        d.month,
        d.day,
        t.hour,
        t.min,
        t.sec,
        '-8'
        )
  end

  def date_of_next(day)
    date  = Date.parse(day)
    # should this be >= or =??
    delta = date >= Date.today ? 0 : 7
    date + delta
  end

  def parked_num_and_lowest_match?(parked)
    self.get_lowest_street_number.even? == parked.street_number.even?
  end

  def get_lowest_street_number
     a =[self.lf_fadd, self.lf_toadd, self.rt_fadd, self.rt_toadd].min
  end

  def lowest_num_and_cnn_match?
    a = [self.lf_fadd, self.lf_toadd, self.rt_fadd, self.rt_toadd]
    if a.index(a.min) == (0 || 1)
      col_of_lowest = "L"
    else
      col_of_lowest = "R"
    end
    col_of_lowest == self.cnnrightle
  end




end




  # def format_weekdays
  #     if self.weekday == "Sun"
  #       self.weekday = self.weekday.gsub("Sun", 0)
  #     elsif self.weekday == "Mon"
  #       self.weekday = self.weekday.gsub("Mon", 1)
  #     elsif self.weekday == "Tue"
  #       self.weekday = self.weekday.gsub("Tue", 2)
  #     elsif self.weekday == "Wed"
  #       self.weekday = self.weekday.gsub("Wed", 3)
  #     elsif self.weekday == "Thu"
  #       self.weekday = self.weekday.gsub("Thu", 4)
  #     elsif self.weekday == "Fri"
  #       self.weekday = self.weekday.gsub("Fri", 5)
  #     elsif self.weekday == "Sat"
  #       self.weekday = self.weekday.gsub("Sat", 6)
  #     end
  # end

  # def self.time_zone_aware_attributes
  #    false
  # end

 #  def self.import_shapefile(filename)
	# 	RGeo::Shapefile::Reader.open(filename) do |file|
	# 	  puts "File contains #{file.num_records} records."
	# 	  file.each do |record|
	# 	    args = Hash[record.attributes.map{|(k,v)| [k.downcase.to_sym,v]}]
	# 	    Route.create(args)
	# 	  	if record.index == 30 then break end
	# 	  end
	# 	  file.rewind
	# 	  record = file.next
	# 	end
	# end
