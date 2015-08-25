class Article < ActiveRecord::Base
  has_many :comments

  default_scope { order(created_at: :desc) }

  def to_param
    return "#{self.id}-#{self.subject}".parameterize
  end


  def notify
    Subscriber.all.each do |sub|
      ArticleMailer.notification_email(sub, self).deliver_later
    end
  end
  handle_asynchronously :notify
end
