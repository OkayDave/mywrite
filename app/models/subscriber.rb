class Subscriber < ActiveRecord::Base

  before_create :generate_unsubscribe_token

  def self.subscribe(email)
    sub = Subscriber.find_or_initialize_by(email: email)

    return sub if sub.persisted?

    sub.save

    return sub
  end

  def generate_unsubscribe_token
    self.token = Digest::MD5.base64digest("#{@email}#{rand(0..100000)}")
  end

  def generate_unsubscribe_token!
    generate_unsubscribe_token
    self.save
  end
end
