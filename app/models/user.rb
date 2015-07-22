require 'twilio-ruby'

class User < ActiveRecord::Base
  include BCrypt
  include SecureRandom

  has_many  :parking_events
  has_many  :contacts

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def generate_token
    new_token = SecureRandom.hex
    self.update_attribute(:token, new_token)
  end

  def send_sms(to_number, body_text)

    twilio_SID = 'AC353193f53993d0d25fde1832142cb278'
    twilio_token = 'a1fdbf3a9b4f14136ce094e57aafa90e'
    client = Twilio::REST::Client.new twilio_SID, twilio_token
    from = '+12027594035'

    message = client.account.messages.create(
        from: from,
        to: to_number,
        body: body_text
      )
  end




end
