class Article < ActiveRecord::Base
  has_many :comments

  


  def notify
    Subscriber.all.each do |sub|
      ArticleMailer.notification_email(sub, self).deliver_later
    end
  end
  handle_asynchronously :notify
end
