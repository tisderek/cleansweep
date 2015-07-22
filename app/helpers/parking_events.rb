require 'twilio-ruby'

helpers do

  def send_sms(to_number, body_text)

    twilio_SID = 'AC353193f53993d0d25fde1832142cb278'
    twilio_token = 'a1fdbf3a9b4f14136ce094e57aafa90e'
    client = Twilio::Rest::Client.new twilio_SID, twilio_token
    from = '+12027594035'

    message = client.account.messages.create(
        from: from,
        to: to_number,
        body: body_text
      )
  end

  module DateTimeMixin

    def next_week
      self + (7 - self.wday)
    end

    def next_wday(n)
      n > self.wday ? self + (n - self.wday) : self.next_week.next_day(n)
    end

  end

end
