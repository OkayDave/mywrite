class Subscriber < ActiveRecord::Base


  def self.subscribe(email)
    return Subscriber.find_or_create_by(email: email)
  end
end
