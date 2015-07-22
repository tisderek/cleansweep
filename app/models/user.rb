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






end
