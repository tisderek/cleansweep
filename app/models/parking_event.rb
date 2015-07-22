require 'date'
class ParkingEvent < ActiveRecord::Base
  belongs_to   :user
  include Geokit
  include DateTimeMixin

  before_create :reverse_geocode

  def reverse_geocode
    location = LatLng.new(self.lat, self.lng)
    self.street_number = location.reverse_geocode.street_number
    self.street_name = location.reverse_geocode.street_name
  end

  def add_route_to_parking_event
    self.next_sweep
  end

  def routes_by_street
    Route.where(streetname: self.street_name)
  end

  def ceiling_filter
    parked = self
    self.routes_by_street.to_a.select do |r|
        (  (r.lf_fadd <= parked.street_number) || (r.rt_fadd <= parked.street_number)  )
    end
  end

  def floor_filter
    parked = self
    self.ceiling_filter.select do |r|
        (  (r.lf_toadd >= parked.street_number) || (r.rt_toadd >= parked.street_number) )
    end
  end

  def side_filter
    parked = self
    self.floor_filter.select do |r|
      match_of_parked_num_and_lowest = r.parked_num_and_lowest_match?(parked)
      match_of_lowest_num_and_cnn = r.lowest_num_and_cnn_match?
      match_of_lowest_num_and_cnn == match_of_parked_num_and_lowest
    end
  end

  def get_route
    t = Time.new
    week_routes = []
    side_filter.each do |route|
      r = route.make_time_obj
      week_routes << r
    end
    week_routes.sort!.first
  end

  def send_sms(body_text)

    to_number = User.find(self.user_id).phone_number
    client = Twilio::REST::Client.new twilio_SID, twilio_token
    from = '+14152341719'

    message = client.account.messages.create(
        from: from,
        to: to_number,
        body: body_text
      )
  end

  private

  def twilio_SID
    'AC353193f53993d0d25fde1832142cb278'
  end

  def twilio_token
    'a1fdbf3a9b4f14136ce094e57aafa90e'
  end



  # def next_week(today)
  #   today + (7 - today.wday)
  # end

  # def next_wday (n)
  #   t = Time.new.wday
  #   sweepday = t
  #   if t - n.weekday >= 0
  #     return
  #   # get current day wday to t.wday
  #   # make sweepday = t.wday
  #   # subtract route weekday from t.wday
  #   # if positive, add (difference [*  2592000]) to sweepday
  #   # if negative, add (7 [* 2592000]) and subtract the negative result
  #   #

  # end

  # def get_route
  #   parked = self
  #   current_wday = Time.new.wday
  #   current_time = Timen.new.strftime('%l:%M%P')
  #   sorted_array = self.side_filter.sort_by { |route| route.weekday <=> current_wday}
  #   binding.pry
  #   sorted_array.each do |r|
  #     route_start = r.fromhour.strftime('%l:%M%P')
  #     if current_wday == r.weekday && current_time < r.route_start
  #       return r
  #     else

  #       return r
  #     end
  #   end
  # end

    #  until the value of the current day is t
    #  first, check the day. if its not good...
    #  while

    #     end

    #   end
    # end

  def route_start
    (self.get_route[0].fromhour).strftime('%l:%M%P')
  end

  def route_end
    (self.get_route[0].tohour).strftime('%l:%M%P')
  end


end

  # receive routes by street
  # get a route where the parked number is between the lowest of from/to #s and the highest of from/to #s
  # once you find a record, select all of the routes that have similar from/to values
  # then, consider the current weekday and select a route from the collection above
    # see what wday is today and the current time
    # if there's a route w wday = to mine, look at the time of the route:
      # if it is later than now, use that
      # otherwise, use a route w a wday larger than today
#
# number : 526
#
# Q: which col has the highest num?
# A: RT_TOADD (599)
#
# Q: which col has the lowest num?
# A: LF_FADD (500)
#
# Q: if looking from lowest to highest, what side is the lowest in?
# A: L
#
# - get the number (536)
# - odd or even? (E)
#
# Get routes_by_street
# - gather the lowest # across LF/RT cols.
# - save the first two lettes of the col w the lowest # as "side"
# - determine if the lowest number in every record is O or E, save that.
# - filter-in the Routes w lowest #s that match the type of ParkingEvent.number
# - filter-in the Routes where FADD the same type of the parking number and smaller thna the parking num
# - get the Routes where TOADD the same type of the parking number and bigger than the parking num
# -



  # def l_ceiling
  #   ceiling = self.routes_by_street.where("lf_fadd <= ?", self.street_number)
  #   # floor = self.routes_by_street.where("rt_fadd >= ?", self.street_number)
  # end

  # def l_floor
  #   # ceiling = self.routes_by_street.where("lf_fadd <= ?", self.street_number)
  #   floor = l_ceiling.where("lf_toadd >= ?", self.street_number)
  # end

  # def r_ceiling
  #   ceiling = self.routes_by_street.where("rt_fadd <= ?", self.street_number)
  #   # floor = self.routes_by_street.where("rt_fadd >= ?", self.street_number)
  # end

  # def r_floor
  #   # ceiling = self.routes_by_street.where("lf_fadd <= ?", self.street_number)
  #   floor = r_ceiling.where("rt_toadd >= ?", self.street_number)
  # end

  # def filter_by_num
  #   filter = r_floor.push(l_floor).flatten
  # end
